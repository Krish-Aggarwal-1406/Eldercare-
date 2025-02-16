import 'package:flutter/material.dart';

class EmergencyAlertScreen extends StatelessWidget {
  void _sendEmergencySignal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 30.0),
              const SizedBox(width: 8.0),
              Text("Emergency Alert"),
            ],
          ),
          content: Text(
            "An emergency signal has been sent near the care receiver's location. Volunteers nearby have been notified.",
            style: TextStyle(fontSize: 16.0),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK", style: TextStyle(fontSize: 16.0)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    final srcHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Emergency Assistance"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: srcHeight * 0.03),


            Center(
              child: Image.asset('assets/images/map3.png'),
            ),

            SizedBox(height: srcHeight * 0.03),


            Text(
              "Nearby Volunteers",
              style: TextStyle(
                fontSize: srcWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.greenAccent,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text("Volunteer ${index + 1}"),
                      subtitle: Text("0.${index + 1} km away"),
                      trailing: Icon(Icons.check_circle, color: Colors.green),
                    ),
                  );
                },
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _sendEmergencySignal(context),
                icon: Icon(Icons.warning_amber_rounded, color: Colors.white),
                label: Text("Send Emergency Signal"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: srcHeight * 0.02),
          ],
        ),
      ),
    );
  }
}

