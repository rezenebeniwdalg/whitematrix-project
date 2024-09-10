// // // // import 'package:flutter/material.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:whitematrix/otpverify.dart';


// // // // class AuthScreen extends StatefulWidget {
// // // //   const AuthScreen({super.key});
// // // //   @override
// // // //   State<AuthScreen> createState() => _AuthScreenState();
// // // // }

// // // // class _AuthScreenState extends State<AuthScreen> {
// // // //   TextEditingController _phoneController = TextEditingController();

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(title: Text('Sign In')),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           children: [
// // // //             TextField(
// // // //               controller: _phoneController,
// // // //               keyboardType: TextInputType.phone,
// // // //               decoration: InputDecoration(labelText: 'Phone Number'),
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             ElevatedButton(
// // // //               onPressed: () async {
                
// // // //                 // TODO: Validate phone number and send OTP using Firebase Auth SDK
// // // //                 await FirebaseAuth.instance.verifyPhoneNumber(
                 
// // // //                   verificationCompleted: (PhoneAuthCredential credential) async {
// // // //                     await FirebaseAuth.instance.signInWithCredential(credential);
// // // //                   },
// // // //                   verificationFailed: (FirebaseAuthException ex) {
// // // //                     print('Verification failed: ${ex.message}');
// // // //                     ScaffoldMessenger.of(context).showSnackBar(
// // // //                       SnackBar(content: Text('Verification failed. ${ex.message}')),
// // // //                     );
// // // //                   },
// // // //                   codeSent: (String verificationId, int? resendToken) {
// // // //                     Navigator.push(
// // // //                       context,
// // // //                       MaterialPageRoute(
// // // //                         builder: (context) => OTPVerificationScreen(verificationId: verificationId),
// // // //                       ),
// // // //                     );
// // // //                   },
// // // //                   codeAutoRetrievalTimeout: (String verificationId) {},
// // // //                    phoneNumber:  _phoneController.text.toString(),
                  
// // // //                 );
// // // //               },
// // // //               child: Text('Send OTP'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:whitematrix/otpverify.dart';
// // // import 'package:whitematrix/otpverify.dart';

// // // class AuthScreen extends StatelessWidget {
// // //   final TextEditingController _phoneController = TextEditingController();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Sign In')),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           children: [
// // //             TextField(
// // //               controller: _phoneController,
// // //               keyboardType: TextInputType.phone,
// // //               decoration: InputDecoration(labelText: 'Phone Number'),
// // //             ),
// // //             SizedBox(height: 16),
// // //             ElevatedButton(
// // //               onPressed: () async {
// // //                 String phone = _phoneController.text.trim();
// // //                 await FirebaseAuth.instance.verifyPhoneNumber(
// // //                   phoneNumber: phone,
// // //                   timeout: Duration(seconds: 60),
// // //                   verificationCompleted: (PhoneAuthCredential credential) async {
// // //                     // Automatically sign in if the OTP is auto-detected
// // //                     await FirebaseAuth.instance.signInWithCredential(credential);
// // //                   },
// // //                   verificationFailed: (FirebaseAuthException e) {
// // //                     print('Verification failed: ${e.message}');
// // //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // //                       content: Text("Verification failed. Please try again."),
// // //                     ));
// // //                   },
// // //                   codeSent: (String verificationId, int? resendToken) {
// // //                     // Navigate to OTP verification screen
// // //                     Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                         builder: (context) => OTPVerificationScreen(verificationId: verificationId),
// // //                       ),
// // //                     );
// // //                   },
// // //                   codeAutoRetrievalTimeout: (String verificationId) {
// // //                     print("Timeout reached: $verificationId");
// // //                   },
// // //                 );
// // //               },
// // //               child: Text('Send OTP'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:email_auth/email_auth.dart';
// // import 'otp_verification_screen.dart';

// // class AuthScreen extends StatelessWidget {
// //   final TextEditingController _emailController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Email Sign In')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _emailController,
// //               keyboardType: TextInputType.emailAddress,
// //               decoration: InputDecoration(labelText: 'Email Address'),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 String email = _emailController.text.trim();

// //                 // Initialize email OTP authentication instance
// //                 EmailAuth.sessionName = "E-Commerce App";
// //                 bool result = await EmailAuth.sendOtp(receiverMail: email, recipientMail: '');

// //                 if (result) {
// //                   // OTP sent successfully
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => OTPVerificationScreen(email: email),
// //                     ),
// //                   );
// //                 } else {
// //                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                     content: Text("Failed to send OTP. Please try again."),
// //                   ));
// //                 }
// //               },
// //               child: Text('Send OTP'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:whitematrix/otpverify.dart';


// class AuthScreen extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();

//   // Create an instance of EmailAuth
//   final EmailAuth emailAuth = EmailAuth(sessionName: "E-Commerce App");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Email Sign In')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(labelText: 'Email Address'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 String email = _emailController.text.trim();

//                 if (email.isEmpty || !email.contains('@')) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text("Please enter a valid email address."),
//                   ));
//                   return;
//                 }

//                 // Send OTP to email
//                 bool result = await emailAuth.sendOtp(recipientMail: email);

//                 if (result) {
//                   // OTP sent successfully
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => OTPVerificationScreen(email: email),
//                     ),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text("Failed to send OTP. Please try again."),
//                   ));
//                 }
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
import 'package:whitematrix/otpverify.dart';
import 'package:whitematrix/sendotpmail.dart';


class AuthScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String otp = generateOtp();  // Generate a random OTP
                await sendOtpEmail(email, otp);  // Send OTP email

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPVerificationScreen(email: email, otp: otp),
                  ),
                );
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to generate OTP
  String generateOtp() {
    // Randomly generate a 6-digit OTP
    return (100000 + (900000 * (new DateTime.now().millisecondsSinceEpoch % 1))).toInt().toString();
  }
}
