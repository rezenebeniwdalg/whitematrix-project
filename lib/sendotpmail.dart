import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> sendOtpEmail(String email, String otp) async {
  // Use your own email and app-specific password for Gmail
  String username = 'your-email@gmail.com';
  String password = 'your-app-password';  // Generate app-specific password in Gmail

  final smtpServer = gmail(username, password);  // Using Gmail's SMTP server

  // Create the message
  final message = Message()
    ..from = Address(username, 'E-Commerce App')
    ..recipients.add(email)
    ..subject = 'Your OTP Code'
    ..text = 'Your OTP code is: $otp';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. ${e.toString()}');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
