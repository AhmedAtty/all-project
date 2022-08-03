import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  FirebaseAuth _auth = FirebaseAuth.instance;

  //FacebookLogin _facebookLogin =FacebookLogin();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );
    await _auth.signInWithCredential(credential);
  }

  // void facebookSignInMethod()async{
  //   FacebookLoginResult? result =  await _facebookLogin.logIn(permissions:[FacebookPermission.email] );
  //   final accessToken =result.accessToken?.token;
  //   if(result.status == FacebookLoginStatus.success){
  //     final faceCredential = FacebookAuthProvider.credential(accessToken!);
  //     await _auth.signInWithCredential(faceCredential);
  //   }
  // }
}
