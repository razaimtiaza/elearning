import 'package:e_learning/screen/homepage/view_model/teachercontroller.dart';
import 'package:e_learning/utililts/colors/color.dart';
import 'package:e_learning/widget/coutomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  final FileUploadController fileUploadController =
      Get.put(FileUploadController());

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: circlebar,
        title: const Center(child: Text("Teacher Dashboard")),
      ),
      body: Obx(() {
        return Stack(
          children: [
            if (fileUploadController.isUploading.value ||
                fileUploadController.isFetching.value)
              Center(
                child: CircularProgressIndicator(
                  value: fileUploadController.isUploading.value
                      ? fileUploadController.uploadProgress.value
                      : null,
                ),
              )
            else
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: fileUploadController.uploadedFiles.length,
                      itemBuilder: (context, index) {
                        final fileUrl =
                            fileUploadController.uploadedFiles[index];
                        final fileName = fileUrl
                            .split('/')
                            .last
                            .split('%2F')
                            .last
                            .split('?')
                            .first; // Extract file name from URL
                        return ListTile(
                          title: Text(fileName),
                          onTap: () {
                            // Implement file open functionality if needed
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CoutomButton(
                      onPressed:
                          fileUploadController.requestPermissionAndPickFile,
                      icon: Icons.upload_file,
                      text: "Upload Lecture",
                    ).paddingOnly(
                        bottom: MediaQuery.of(context).size.height * 0.04),
                  ),
                ],
              ),
          ],
        );
      }),
    );
  }
}
