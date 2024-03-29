import 'package:brando/src/core/core.dart';
import 'package:brando/src/models/models.dart';

String generateAdminEmailHtml(Appointment appointment, String locale) {
  // Assuming your Appointment class and its methods are properly defined as mentioned earlier
  // And assuming the formattedDate and formattedTimeslot methods properly format the date and time slots
  String htmlContent = """
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Appointment Booking</title>
<style>
  body { font-family: Arial, sans-serif; }
  .container { width: 100%; max-width: 600px; margin: 0 auto; background-color: #f8f8f8; padding: 20px; }
  .header { background-color: #FDDABE; color: #ffffff; padding: 10px; text-align: center; }
  .content { padding: 20px; }
  .footer { text-align: center; margin-top: 20px; font-size: 0.9em; color: #777; }
  table { width: 100%; border-collapse: collapse; }
  th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
  th { background-color: #FDDABE; color: white; }
</style>
</head>
<body>
<div class="container">
  <div class="header">
    <h2>New Appointment Booking</h2>
  </div>
  <div class="content">
    <p>A new appointment has been booked. Here are the details:</p>
    <table>
      <tr>
        <th>Title</th>
        <td>${appointment.title}</td>
      </tr>
      <tr>
        <th>Date</th>
        <td>${appointment.formattedDate(locale)}</td>
      </tr>
      <tr>
        <th>Time Slot</th>
        <td>${appointment.formattedTimeslot}</td>
      </tr>
      <tr>
        <th>Client Name</th>
        <td>${appointment.name}</td>
      </tr>
      <tr>
        <th>Phone Number</th>
        <td>${appointment.phoneNumber}</td>
      </tr>
    </table>
    <p>Please review the appointment and prepare accordingly.</p>
  </div>
  <div class="footer">
    <p>Best Regards,</p>
    <p>$companyName</p>
  </div>
</div>
</body>
</html>
""";

  return htmlContent;
}
