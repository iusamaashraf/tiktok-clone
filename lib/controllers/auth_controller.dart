import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage;
  File? get profilePhoto => _pickedImage.value;

  // Pick image from camera or gallery
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture.');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  //upload to firebase storage function
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //creating method to register a users
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save out user authentication and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        print('error is ' + downloadUrl);

        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson())
            .then((value) {
          print('data added successfully');
        }).catchError((e) {
          print('error is $e');
        });
      } else {
        Get.snackbar('Error creating account', 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error creating account', e.toString());
    }
  }
}
