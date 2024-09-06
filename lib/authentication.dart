// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:whitematrix/otpverify.dart';


// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});
//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   TextEditingController _phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign In')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
                
//                 // TODO: Validate phone number and send OTP using Firebase Auth SDK
//                 await FirebaseAuth.instance.verifyPhoneNumber(
                 
//                   verificationCompleted: (PhoneAuthCredential credential) async {
//                     await FirebaseAuth.instance.signInWithCredential(credential);
//                   },
//                   verificationFailed: (FirebaseAuthException ex) {
//                     print('Verification failed: ${ex.message}');
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Verification failed. ${ex.message}')),
//                     );
//                   },
//                   codeSent: (String verificationId, int? resendToken) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => OTPVerificationScreen(verificationId: verificationId),
//                       ),
//                     );
//                   },
//                   codeAutoRetrievalTimeout: (String verificationId) {},
//                    phoneNumber:  _phoneController.text.toString(),
                  
//                 );
//               },
//               child: Text('Send OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whitematrix/otpverify.dart';
import 'package:whitematrix/otpverify.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String phone = _phoneController.text.trim();
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phone,
                  timeout: Duration(seconds: 60),
                  verificationCompleted: (PhoneAuthCredential credential) async {
                    // Automatically sign in if the OTP is auto-detected
                    await FirebaseAuth.instance.signInWithCredential(credential);
                  },
                  verificationFailed: (FirebaseAuthException e) {
                    print('Verification failed: ${e.message}');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Verification failed. Please try again."),
                    ));
                  },
                  codeSent: (String verificationId, int? resendToken) {
                    // Navigate to OTP verification screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPVerificationScreen(verificationId: verificationId),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {
                    print("Timeout reached: $verificationId");
                  },
                );
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
