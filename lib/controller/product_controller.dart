import 'package:geojit_test_app/model/all_data.dart';
import 'package:geojit_test_app/services/api_services.dart';
import 'package:get/get.dart';


class AllDataController extends GetxController{
  // ignore: deprecated_member_use
  List<AllData> allDataList = <AllData>[].obs;
  var isLoading =true.obs;

  @override
  void onInit() async {
    fetchAllData();
    super.onInit();
  }

  Future fetchAllData() async {
    isLoading(true);
    try {
      var alldata=await ApiService.getAll();
      if(alldata!=null){
        allDataList.add(alldata) ;
      }
      return allDataList;
    } finally{
      isLoading(false);
    }

  }
}