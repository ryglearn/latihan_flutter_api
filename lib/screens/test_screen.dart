import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/test_controller.dart';

class TestScreen extends StatelessWidget {
  final TestController controller = Get.put(TestController());
  
  TestScreen({Key? key}) : super(key: key); // Tambahkan key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test API'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status: ${controller.testData.value.status}'),
                    Text('Message: ${controller.testData.value.message}'),
                    SizedBox(height: 20),
                    Text('Data:'),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.testData.value.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.testData.value.data[index]),
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}