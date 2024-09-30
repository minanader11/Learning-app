import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginWithoutFirebase{

 Future<GoogleSignInAuthentication?> googleSignIn()async{
//Default definition
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'openid',  // Add openid scope
        'profile',
      ],
    );

//If current device is Web or Android, do not use any parameters except from scopes.
    if (kIsWeb || Platform.isAndroid ) {
      googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'openid',  // Add openid scope
          'profile',
        ],
        serverClientId: "771987165035-0vbch3ru31hhv8icg4moi01iqavphe8f.apps.googleusercontent.com"
      );
    }

//If current device IOS or MacOS, We have to declare clientID
//Please, look STEP 2 for how to get Client ID for IOS
    if (Platform.isIOS || Platform.isMacOS) {
      googleSignIn = GoogleSignIn(
        clientId:
        "YOUR_CLIENT_ID.apps.googleusercontent.com",
        scopes: [
          'email',
        ],
      );
    }

    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

//If you want further information about Google accounts, such as authentication, use this.
    final GoogleSignInAuthentication googleAuthentication = await googleAccount!.authentication;
    print("${googleAccount.email}email");
    return googleAuthentication;
  }
}