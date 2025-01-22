import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of notifications with details such as title, message, timestamp, and category
    final List<Map<String, String>> notifications = [
      {
        'title': 'Medication Reminder',
        'message': 'It\'s time for your morning medication: 5mg of Paracetamol.',
        'timestamp': '2025-01-22 08:00 AM',
        'category': 'Medication',
      },
      {
        'title': 'Health Alert',
        'message': 'Your heart rate is too high. Please check your vitals.',
        'timestamp': '2025-01-22 07:45 AM',
        'category': 'Health Monitoring',
      },
      {
        'title': 'Doctor Appointment Reminder',
        'message': 'Your doctor visit is scheduled for 3 PM today.',
        'timestamp': '2025-01-21 09:00 AM',
        'category': 'Appointment',
      },
      {
        'title': 'Emergency SOS Alert',
        'message': 'SOS triggered! Volunteers are on their way.',
        'timestamp': '2025-01-22 06:30 PM',
        'category': 'Emergency',
      },
      {
        'title': 'Activity Alert',
        'message': 'You have not moved for the past 2 hours. Please take a walk.',
        'timestamp': '2025-01-22 10:00 AM',
        'category': 'Activity Monitoring',
      },
      {
        'title': 'Medication Reminder',
        'message': 'It\'s time for your evening medication: 10mg of Ibuprofen.',
        'timestamp': '2025-01-22 07:00 PM',
        'category': 'Medication',
      },
      {
        'title': 'Health Alert',
        'message': 'Blood pressure is too high. Please consult your doctor.',
        'timestamp': '2025-01-21 05:30 PM',
        'category': 'Health Monitoring',
      },
      {
        'title': 'Activity Alert',
        'message': 'Goal achieved! You walked 10,000 steps today.',
        'timestamp': '2025-01-21 08:00 PM',
        'category': 'Activity Monitoring',
      },
      {
        'title': 'Emergency SOS Alert',
        'message': 'SOS triggered! Assistance is on the way.',
        'timestamp': '2025-01-22 12:15 PM',
        'category': 'Emergency',
      },
      {
        'title': 'Appointment Reminder',
        'message': 'Your dental check-up appointment is tomorrow at 2 PM.',
        'timestamp': '2025-01-22 09:00 AM',
        'category': 'Appointment',
      },
      {
        'title': 'Medication Reminder',
        'message': 'Don\'t forget your 2pm medication: 20mg of Amoxicillin.',
        'timestamp': '2025-01-22 02:00 PM',
        'category': 'Medication',
      },
    ];

    // Notification Category Icons
    IconData _getCategoryIcon(String category) {
      switch (category) {
        case 'Medication':
          return Icons.medical_services;
        case 'Health Monitoring':
          return Icons.favorite;
        case 'Appointment':
          return Icons.calendar_today;
        case 'Emergency':
          return Icons.warning_amber_rounded;
        case 'Activity Monitoring':
          return Icons.directions_run;
        default:
          return Icons.notifications;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          // Safely access the values from the notification map
          String title = notification['title'] ?? 'No title';
          String message = notification['message'] ?? 'No message';
          String timestamp = notification['timestamp'] ?? 'No timestamp';
          String category = notification['category'] ?? 'General';

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                _getCategoryIcon(category),
                color: Colors.blueAccent,
              ),
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    timestamp,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.check_circle_outline, color: Colors.green),
                onPressed: () {
                  // Action to mark as read (you can implement logic here)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Marked as read')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
