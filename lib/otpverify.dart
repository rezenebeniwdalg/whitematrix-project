// // // import 'dart:math';

// // // import 'package:flutter/material.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:whitematrix/scratch.dart';


// // // class OTPVerificationScreen extends StatefulWidget {
// // //   OTPVerificationScreen({super.key, required this.verificationId});

// // //  String verificationId;

// // //   // OTPVerificationScreen({required this.verificationId});

// // //   @override
// // //   State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
// // // }

// // // class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
// // //   TextEditingController _otpController = TextEditingController();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Verify OTP')),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           children: [
// // //             TextField(
// // //               controller: _otpController,
// // //               keyboardType: TextInputType.phone,
// // //               decoration: InputDecoration(labelText: 'Enter OTP'),
// // //             ),
// // //             SizedBox(height: 16),
// // //             ElevatedButton(
// // //               onPressed: () async {
// // // try{
// // //   PhoneAuthCredential credential=await PhoneAuthProvider.credential(verificationId: widget.verificationId , smsCode: _otpController.text.toString());
// // //   FirebaseAuth.instance.signInWithCredential(credential).then((value){
// // //     Navigator.push(
// // //       context,
// // //       MaterialPageRoute(builder: (context) => ScratchCardScreen()),
// // //     );
// // //   });
// // // }
// // // catch(ex){
// // //   log(ex.toString() as num);
// // //   // print(ex.toString());
// // //   // showDialog(
// // //   //   context: context,
// // //   //   child: AlertDialog(
// // //   //     title: Text('Error'),
// // //   //     content: Text(ex.toString()),
// // //   //   ),
// // //   // );
// // //   // return;
 
// // // }



// // //                 // String otp = _otpController.text.toString();
// // //                 // PhoneAuthCredential credential = PhoneAuthProvider.credential(
// // //                 //   verificationId: widget.verificationId,
// // //                 //   smsCode: otp,
// // //                 // );
// // //                 // await FirebaseAuth.instance.signInWithCredential(credential).then((value) =>  Navigator.push(
// // //                 //   context,
// // //                 //   MaterialPageRoute(builder: (context) => ScratchCardScreen()),
// // //                 // ));
               
// // //               },
// // //               child: Text('Verify OTP'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:whitematrix/scratch.dart';


// // class OTPVerificationScreen extends StatelessWidget {
// //   final String verificationId;
// //   final TextEditingController _otpController = TextEditingController();

// //   OTPVerificationScreen({required this.verificationId});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Verify OTP')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _otpController,
// //               keyboardType: TextInputType.number,
// //               decoration: InputDecoration(labelText: 'Enter OTP'),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 String otp = _otpController.text.trim();
// //                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
// //                   verificationId: verificationId,
// //                   smsCode: otp,
// //                 );
// //                 try {
// //                   await FirebaseAuth.instance.signInWithCredential(credential);
// //                   // Navigate to scratch card screen on successful sign in
// //                   Navigator.pushReplacement(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => ScratchCardScreen(),
// //                     ),
// //                   );
// //                 } catch (e) {
// //                   print("OTP Verification failed: ${e.toString()}");
// //                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                     content: Text("OTP verification failed. Please try again."),
// //                   ));
// //                 }
// //               },
// //               child: Text('Verify OTP'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:whitematrix/scratch.dart';


// class OTPVerificationScreen extends StatelessWidget {
//   final String email;
//   final TextEditingController _otpController = TextEditingController();

//   OTPVerificationScreen({required this.email});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Verify OTP')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter OTP'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 String otp = _otpController.text.trim();
//                 // Verify the OTP
//                 bool result = EmailAuth.validate(
//                     receiverMail: email, userOTP: otp);

//                 if (result) {
//                   // OTP is valid, sign in the user with Firebase
//                   try {
//                     UserCredential userCredential =
//                         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                       email: email,
//                       password: otp, // Using OTP as a temporary password
//                     );

//                     // Navigate to the scratch card screen after successful login
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ScratchCardScreen(),
//                       ),
//                     );
//                   } catch (e) {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text("Sign-in failed: ${e.toString()}"),
//                     ));
//                   }
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text("Invalid OTP. Please try again."),
//                   ));
//                 }
//               },
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whitematrix/scratch.dart';

class OTPVerificationScreen extends StatelessWidget {
  final String email;
  final TextEditingController _otpController = TextEditingController();
 String otp;

  // Initialize EmailAuth instance
  final EmailAuth emailAuth = EmailAuth(sessionName: "E-Commerce App");

  OTPVerificationScreen({required this.email, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter OTP'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String otp = _otpController.text.trim();

                // Validate the OTP
                bool result = emailAuth.validateOtp(
                  recipientMail: email,
                  userOtp: otp,
                );

                if (result) {
                  // OTP is valid, sign in the user with Firebase
                  try {
                    UserCredential userCredential =
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: otp, // Using OTP as a temporary password
                    );

                    // Navigate to the scratch card screen after successful login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScratchCardScreen(),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Sign-in failed: ${e.toString()}"),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Invalid OTP. Please try again."),
                  ));
                }
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
