import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/purchase_plan_request_model/purchase_plan_request_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class PurchasePlanRequests extends StatefulWidget {
  const PurchasePlanRequests({super.key});

  @override
  State<PurchasePlanRequests> createState() => _PurchasePlanRequestsState();
}

class _PurchasePlanRequestsState extends State<PurchasePlanRequests> {
  List<PurchasePlanRequest> requests = [];
  ApiStatus status = ApiStatus.initial;
  String message = '';
  int loadingIndex = -1;
  int declineIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPlanRequests();
  }

  fetchPlanRequests({bool firstLoad = true}) async{
    try{
      if(firstLoad){
        status = ApiStatus.loading;
        setState(() {});
      }
      var res = await ApiServices().getRequest('plan/purchase_plan_request');
      PurchasePlanRequestModel resp = PurchasePlanRequestModel.fromJson(res);
      if(resp.status){
        requests = resp.data;
        message = resp.message;
        status = ApiStatus.success;
        setState(() {});
      }else{
        status = ApiStatus.error;
        message = resp.message;
        setState(() {});
      }
    }catch(e){
      // debugPrint(e.toString());
      status = ApiStatus.error;
      message = e.toString();
      setState(() {});
    }
  }

  void approvePlan(PurchasePlanRequest request, int index) async{
    try{
      loadingIndex = index;
      setState(() {});
      var res = await ApiServices().postRequest('plan/add_purchase_plan', data: {
        "purchaseDate": "${DateTime.now()}",
        "planId": request.planId,
        "expiry": "${DateTime.now().add(const Duration(days: 180))}",
        "status": true,
      });
      ActionStatusModel resp = ActionStatusModel.fromJson(res);
      if(resp.status){
        fetchPlanRequests(firstLoad: false);
        Utils.showFlushBar(resp.message, FlushBarType.success, context);
      }else{
        Utils.showFlushBar(resp.message, FlushBarType.error, context);
      }
    }catch(e){
      // debugPrint(e.toString());
      setState(() {});
    }finally{
      loadingIndex = -1;
      setState(() {});
    }
  }

  void declinePlan(PurchasePlanRequest request, int index) async{
    try{
      declineIndex = index;
      setState(() {});
      var res = await ApiServices().postRequest('plan/add_purchase_plan', data: {
        // "purchaseDate": "${DateTime.now()}",
        "planId": request.planId,
        // "expiry": "${DateTime.now().add(const Duration(days: 180))}",
        "declined": true,
      });
      ActionStatusModel resp = ActionStatusModel.fromJson(res);
      if(resp.status){
        fetchPlanRequests(firstLoad: false);
        Utils.showFlushBar(resp.message, FlushBarType.success, context);
      }else{
        Utils.showFlushBar(resp.message, FlushBarType.error, context);
      }
    }catch(e){
      // debugPrint(e.toString());
      setState(() {});
    }finally{
      declineIndex = -1;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan Requests", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: status == ApiStatus.loading
          ? const LoadingWidget()
          : status == ApiStatus.error
          ? CustomErrorWidget(message: message)
          : ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          PurchasePlanRequest purchasePlanRequest = requests[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Column(
              children: [
                ListTile(
                  title: Text(purchasePlanRequest.planName.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.currency_rupee, size: 16),
                          const SizedBox(width: 4),
                          Text("${purchasePlanRequest.amount}/-"), // Replace with actual phone
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(PhosphorIcons.user, size: 16),
                          const SizedBox(width: 4),
                          Text("${purchasePlanRequest.userId?.name}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone, size: 16),
                          const SizedBox(width: 4),
                          Text("${purchasePlanRequest.userId?.phone}"), // Replace with actual phone
                        ],
                      ),
                      if(purchasePlanRequest.userId!.location.isNotEmpty)
                        Row(
                          children: [
                            const Icon(Icons.location_city, size: 16),
                            const SizedBox(width: 4),
                            Text("${purchasePlanRequest.userId?.location}"),
                          ],
                        ),
                      if(purchasePlanRequest.userId!.whatsappNo.isNotEmpty)
                        Row(
                          children: [
                            const Icon(Icons.location_city, size: 16),
                            const SizedBox(width: 4),
                            Text("${purchasePlanRequest.userId?.whatsappNo}"),
                          ],
                        ),
                      if(purchasePlanRequest.userId!.gender.isNotEmpty)
                        Row(
                          children: [
                            const Icon(Icons.person_outlined, size: 16),
                            const SizedBox(width: 4),
                            Text("${purchasePlanRequest.userId?.gender}"),
                          ],
                        ),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          approvePlan(purchasePlanRequest, index);
                        },
                        child: Container(
                          width: 80,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: loadingIndex == index
                                ? const SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Center(child: CircularProgressIndicator(strokeWidth: 1,)),
                                )
                                : const Text("Approve", style: TextStyle(fontSize: 12)),
                          )
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          declinePlan(purchasePlanRequest, index);
                        },
                        child: Container(
                          width: 80,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: declineIndex == index
                                ? const SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Center(child: CircularProgressIndicator(strokeWidth: 1,)),
                                )
                                : const Text("Decline", style: TextStyle(fontSize: 12)),
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Image.network(purchasePlanRequest.image)
              ],
            ),
          );
        },
      ),
    );
  }
}
