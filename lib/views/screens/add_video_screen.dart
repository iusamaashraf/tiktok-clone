import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/confirm_video_screen.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  //This function is for picked video
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    //this condition is for when user open gallery and doesn't choose any video then this condition is run....
    if (video != null) {
      Get.to(() => ConfirmVideoScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ));
    }
    //   if (_controller != null) {
    //     await _controller!.setVolume(0.0);
    //   }
    //   if (isVideo) {
    //     final XFile? file = await _picker.pickVideo(
    //         source: source, maxDuration: const Duration(seconds: 10));
    //     await _playVideo(file);
    //   } else if (isMultiImage) {
    //     await _displayPickImageDialog(context!),
    //         (double? maxWidth, double? maxHeight, int? quality) async {
    //       try {
    //         final List<XFile>? pickedFileList = await _picker.pickMultiImage(
    //           maxWidth: maxWidth,
    //           maxHeight: maxHeight,
    //           imageQuality: quality,
    //         );
    //         setState(() {
    //           _imageFileList = pickedFileList;
    //         });
    //       } catch (e) {
    //         setState(() {
    //           _pickImageError = e;
    //         });
    //       }
    //     });
    //   } else {
    //     await _displayPickImageDialog(context!),
    //         (double? maxWidth, double? maxHeight, int? quality) async {
    //       try {
    //         final XFile? pickedFile = await _picker.pickImage(
    //           source: source,
    //           maxWidth: maxWidth,
    //           maxHeight: maxHeight,
    //           imageQuality: quality,
    //         );
    //         setState(() {
    //           _imageFile = pickedFile;
    //         });
    //       } catch (e) {
    //         setState(() {
    //           _pickImageError = e;
    //         });
    //       }
    //     };
    //   }
  }

//This is the pop up which show the source of video camera or gallery
  showOptionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //for picking video functionality
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: Row(
              children: [
                const Icon(Icons.image),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Gallery',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: Row(
              children: [
                const Icon(Icons.camera_alt),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Camera',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                const Icon(Icons.cancel),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
