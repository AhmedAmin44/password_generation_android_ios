import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:password_gen/core/function/custom_troast.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
     XFile? profilePic;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  /// 🔹 Fetch last generated password from Firestore
  Future<void> fetchLastPassword() async {
    emit(LastPasswordLoading());
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(LastPasswordError("User not found"));
      return;
    }

    final userDoc = await FirebaseFirestore.instance
        .collection('userPasswords')
        .doc(user.uid)
        .get();

    if (userDoc.exists && userDoc.data() != null) {
      emit(LastPasswordVisible(userDoc.data()!['password']));
    } else {
      emit(LastPasswordError("No password found"));
    }
  }
  Future<void> pickAndUploadProfilePic() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        emit(UploadProfilePicError(errorMsg: "No image selected."));
        return;
      }
      uploadProfilePic(image);
    } catch (e) {
      emit(UploadProfilePicError(errorMsg: "$e"));
    }
  }

  void uploadProfilePic(XFile image) {
    try {
      profilePic = image;
      emit(UploadProfilePic());
    } catch (e) {
      emit(UploadProfilePicError(errorMsg: "$e"));
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Future.delayed(Duration(milliseconds: 500), () {
        SystemNavigator.pop();
      });
      emit(ProfileLoggedOut());
    } catch (e) {
      emit(HomeLogOutError(errorMsg: "Logout failed: $e"));
    }
  }
 void fetchUsers() async {
  emit(UsersFetchLoading());
  try {
    var snapshot = await _firestore
        .collection('users')
        .where('role', isEqualTo: 'user') 
        .get();

    List<Map<String, dynamic>> users = snapshot.docs.map((doc) {
      var data = doc.data();
      data['id'] = doc.id; 
      return data;
    }).toList();

    emit(UsersFetchLoaded(users));
  } catch (e) {
    emit(UsersFetchError("Error fetching users: ${e.toString()}"));
  }
}
void deleteUser( String userId, String userEmail) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(userId).delete();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email == userEmail) {
      await user.delete();
      ShowToast( "User Deleted");
    } else {
            ShowToast( "could not delete user");

    }
    fetchUsers();
  } catch (e) {
    emit(UsersFetchError("Failed to delete user: ${e.toString()}"));
  }
}
  // void deleteUserWithoutContext(String userId) async {
  //   try {
  //     await _firestore.collection('users').doc(userId).delete();
  //     fetchUsers();
  //   } catch (e) {
  //     emit(UsersFetchError(e.toString()));
  //   }
  // }

}
