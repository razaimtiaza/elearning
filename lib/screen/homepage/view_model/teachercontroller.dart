import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUploadController extends GetxController {
  var isUploading =
      false.obs; // Observable for tracking if a file is being uploaded
  var uploadProgress = 0.0.obs; // Observable for tracking the upload progress
  var uploadedFiles =
      <String>[].obs; // Observable list to store the URLs of uploaded files
  var isFetching =
      false.obs; // Observable for tracking if files are being fetched

  @override
  void onInit() {
    super.onInit();
    fetchUploadedFiles();
  }

  Future<void> requestPermissionAndPickFile() async {
    if (await _requestStoragePermission()) {
      _pickFile();
    } else {
      Get.snackbar(
          'Permission Denied', 'Storage permission is required to pick a file');
    }
  }

  Future<bool> _requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    return status.isGranted;
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'ppt', 'pptx'],
    );

    try {
      if (result != null) {
        PlatformFile file = result.files.first;
        await _uploadFile(file);
        Get.snackbar('Successful', 'Uploaded file');
        fetchUploadedFiles(); // Fetch files after uploading a new one
      } else {
        Get.snackbar('No File Selected', 'Please select a file to upload');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  Future<void> _uploadFile(PlatformFile file) async {
    isUploading.value = true;
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('uploads/${file.name}');
      final uploadTask = storageRef.putFile(File(file.path!));

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        uploadProgress.value = snapshot.bytesTransferred / snapshot.totalBytes;
      });

      await uploadTask;
      Get.snackbar('Success', 'File uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', 'File upload failed');
    } finally {
      isUploading.value = false;
    }
  }

  Future<void> fetchUploadedFiles() async {
    isFetching.value = true;
    try {
      final ListResult result =
          await FirebaseStorage.instance.ref('uploads').listAll();
      final List<String> files =
          await Future.wait(result.items.map((Reference ref) async {
        return await ref.getDownloadURL();
      }).toList());
      uploadedFiles.assignAll(files);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch files');
    } finally {
      isFetching.value = false;
    }
  }
}
