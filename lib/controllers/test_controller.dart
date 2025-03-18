import 'package:get/get.dart';
import '../models/test_model.dart';
import '../services/test_services.dart';

class TestController extends GetxController {
  var isLoading = true.obs;
  var testData = Welcome(status: '', message: '', data: []).obs;
  
  @override
  void onInit() {
    fetchTestData();
    super.onInit();
  }

  void fetchTestData() async {
    try {
      isLoading(true);
      var data = await TestService().getTestData();
      testData.value = data;
    } catch (e) {
      // Ganti print dengan Get.log
      Get.log('Error saat mengambil data: $e');
    } finally {
      isLoading(false);
    }
  }
}