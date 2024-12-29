import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:r4everstore/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:r4everstore/data/model/all_holidays_model/all_holidays_model.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_dropdown.dart';
import 'package:r4everstore/widgets/app_text_field.dart';

class AddHoliday extends StatefulWidget {
  final HolidayModel? holidayModel;
  const AddHoliday({super.key, this.holidayModel});

  @override
  State<AddHoliday> createState() => _AddHolidayState();
}

class _AddHolidayState extends State<AddHoliday> {
  late HolidayBloc holidayBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayBloc = context.read<HolidayBloc>();
    if(widget.holidayModel != null){
      holidayBloc.add(ChangeHolidayFields(month: widget.holidayModel!.month, day: widget.holidayModel!.day, title: widget.holidayModel!.title));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Holiday", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: BlocListener<HolidayBloc, HolidayState>(
          listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
          listener: (context, state) {
            if(state.actionApiStatus == ApiStatus.error){
              Utils.showFlushBar(state.message, FlushBarType.error, context);
            }
            if(state.actionApiStatus == ApiStatus.success){
              holidayBloc.add(GetHolidaysData());
              Navigator.pop(context);
              Utils.showFlushBar(state.message, FlushBarType.success, context);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              BlocBuilder<HolidayBloc, HolidayState>(
                buildWhen: (previous, current) => previous.title != current.title,
                builder: (context, state) {
                  return AppTextField(
                    title: "Title",
                    initialValue: widget.holidayModel?.title,
                    showTitle: false,
                    onChanged: (value) {
                      holidayBloc.add(ChangeHolidayFields(title: value));
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<HolidayBloc, HolidayState>(
                      buildWhen: (previous, current) => previous.month != current.month,
                      builder: (context, state) {
                        return AppDropdown(
                          items: List.generate(12, (index) => DropdownMenuItem(value: index+1, child: Text(DateFormat.MMMM().format(DateTime(0, index+1))))),
                          onChanged: (value) {
                            holidayBloc.add(ChangeHolidayFields(month: value));
                          },
                          value: state.month,
                          title: "Month",
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: BlocBuilder<HolidayBloc, HolidayState>(
                      buildWhen: (previous, current) => previous.day != current.day,
                      builder: (context, state) {
                        return AppDropdown(
                          items: List.generate(30, (index) => DropdownMenuItem(value: index+1,child: Text("${index+1}"))),
                          onChanged: (value) {
                            holidayBloc.add(ChangeHolidayFields(day: value));
                          },
                          value: state.day,
                          title: "Day",
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<HolidayBloc, HolidayState>(
                buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                builder: (context, state) {
                  return AppButton(
                    title: widget.holidayModel != null ? "Update" : "Add",
                    loading: state.actionApiStatus == ApiStatus.loading,
                    onTap: () {
                      holidayBloc.add(AddNewHoliday(holidayId: widget.holidayModel?.id));
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
