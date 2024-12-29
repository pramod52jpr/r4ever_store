import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:r4everstore/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:r4everstore/data/model/all_holidays_model/all_holidays_model.dart';
import 'package:r4everstore/data/repository/holiday_repo.dart';
import 'package:r4everstore/ui/admin/add_holiday.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class FestivalHolidaysList extends StatefulWidget {
  const FestivalHolidaysList({super.key});

  @override
  State<FestivalHolidaysList> createState() => _FestivalHolidaysListState();
}

class _FestivalHolidaysListState extends State<FestivalHolidaysList> {
  late HolidayBloc holidayBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayBloc = context.read<HolidayBloc>();
    holidayBloc.add(GetHolidaysData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Holidays", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddHoliday()));
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: BlocListener<HolidayBloc, HolidayState>(
        listenWhen: (previous, current) => previous.deleteApiStatus != current.deleteApiStatus,
        listener: (context, state) {
          if(state.deleteApiStatus == ApiStatus.error){
            Utils.showFlushBar(state.message, FlushBarType.error, context);
          }
          if(state.deleteApiStatus == ApiStatus.success){
            Utils.showFlushBar(state.message, FlushBarType.success, context);
            holidayBloc.add(GetHolidaysData());
          }
        },
        child: BlocBuilder<HolidayBloc, HolidayState>(
          buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
          builder: (context, state) {
            if(state.fetchDataApiStatus == ApiStatus.loading || state.fetchDataApiStatus == ApiStatus.initial){
              return const LoadingWidget();
            }
            if(state.fetchDataApiStatus == ApiStatus.error){
              return CustomErrorWidget(message: state.message);
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: state.holidaysData.length, // Replace with actual holiday count
              itemBuilder: (context, index) {
                HolidayModel holiday = state.holidaysData[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.celebration,
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                  ),
                  title: Text(
                    holiday.title, // Replace with actual holiday name
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        'Date: ${DateFormat.MMMMd().format(DateTime(0, holiday.month, holiday.day))}', // Replace with actual date
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      // const SizedBox(height: 4),
                      // Text(
                      //   'Description of the holiday goes here...', // Replace with actual description
                      //   style: TextStyle(
                      //     color: Colors.grey[600],
                      //   ),
                      // ),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: const Text("Edit"),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddHoliday(holidayModel: holiday)));
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("Delete"),
                          onTap: () {
                            Utils.showActionDialog(
                              title: "Delete",
                              content: "Are you sure want to delete?",
                              context: context,
                              onTap: () {
                                holidayBloc.add(DeleteHoliday(holidayId: holiday.id));
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
                      ];
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
