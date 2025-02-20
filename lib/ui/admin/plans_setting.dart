import 'package:flutter/material.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/global_data_model/global_data_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class PlansSetting extends StatefulWidget {
  const PlansSetting({super.key});

  @override
  State<PlansSetting> createState() => _PlansSettingState();
}

class _PlansSettingState extends State<PlansSetting> {
  GlobalData? data;
  ApiStatus status = ApiStatus.initial;
  String message = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchGlobalData();
  }

  void fetchGlobalData({bool firstLoad = true}) async {
    try {
      if(firstLoad){
        status = ApiStatus.loading;
        setState(() {});
      }
      var res = await ApiServices().getRequest("plan/get_payment_qr"); // it is giving global data
      var resp = GlobalDataModel.fromJson(res);
      if (resp.status) {
        data = resp.data;
        message = resp.message;
        status = ApiStatus.success;
        setState(() {});
      } else {
        status = ApiStatus.error;
        message = resp.message;
        setState(() {});
      }
    } catch (e) {
      // debugPrint(e.toString());
      status = ApiStatus.error;
      message = e.toString();
      setState(() {});
    }
  }

  void changePlanSetting({required String planName, required bool lock}) async{
    try{
      var res = await ApiServices().postRequest("plan/change_plan_setting", data: {
        "planName": planName,
        "lock": lock,
      });
      ActionStatusModel resp = ActionStatusModel.fromJson(res);
      if(resp.status){
        Utils.showFlushBar(resp.message, FlushBarType.success, context);
        fetchGlobalData(firstLoad: false);
      }
    }catch(e){
      // debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plans Setting", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: status == ApiStatus.loading
          ? const LoadingWidget()
          : status == ApiStatus.error
              ? CustomErrorWidget(message: message)
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Silver", style: TextStyle(fontSize: 18)),
                          Switch(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            value: data!=null && !data!.silverLock,
                            onChanged: (value) {
                              changePlanSetting(planName: 'silver', lock: !value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Gold", style: TextStyle(fontSize: 18)),
                          Switch(
                            value: data!=null && !data!.goldLock,
                            onChanged: (value) {
                              changePlanSetting(planName: 'gold', lock: !value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Platinum", style: TextStyle(fontSize: 18)),
                          Switch(
                            value: data!=null && !data!.platinumLock,
                            onChanged: (value) {
                              changePlanSetting(planName: 'platinum', lock: !value);
                            },
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text("Diamond", style: TextStyle(fontSize: 18)),
                      //     Switch(
                      //       value: data!=null && !data!.diamondLock,
                      //       onChanged: (value) {
                      //         changePlanSetting(planName: 'diamond', lock: !value);
                      //       },
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
    );
  }
}
