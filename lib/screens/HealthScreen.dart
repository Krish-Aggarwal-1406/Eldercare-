import 'package:flutter/material.dart';

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    final srcHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: srcHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Health Overview",
                        style: TextStyle(
                          fontSize: srcWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Monitor Vitals",
                        style: TextStyle(
                          fontSize: srcWidth * 0.035,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.health_and_safety, size: srcWidth * 0.08),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  healthContainer(srcWidth, "Heart Rate", "75 BPM", Icons.favorite, Colors.red),
                  SizedBox(width: srcWidth * 0.05),
                  healthContainer(srcWidth, "Blood Pressure", "120/80", Icons.water, Colors.blue),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  healthContainer(srcWidth, "Blood Sugar", "95 mg/dL", Icons.bloodtype, Colors.orange),
                  SizedBox(width: srcWidth * 0.05),
                  healthContainer(srcWidth, "Steps", "2,450", Icons.directions_walk, Colors.green),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  healthContainer(srcWidth, "Cholesterol", "180 mg/dL", Icons.monitor_heart, Colors.purple),
                  SizedBox(width: srcWidth * 0.05),
                  healthContainer(srcWidth, "Temperature", "98.6°F", Icons.thermostat, Colors.blueGrey),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                "Today's Medications",
                style: TextStyle(
                  fontSize: srcWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: Column(
                  children: [
                    medicationTile("Lisinopril", "8:00 AM - 10mg"),
                    Divider(height: 1.0),
                    medicationTile("Metformin", "2:00 PM - 500mg"),
                    Divider(height: 1.0),
                    medicationTile("Simvastatin", "8:00 PM - 20mg"),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "Add Reminder",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget healthContainer(double srcWidth, String title, String value, IconData icon, Color color) {
    return Container(
      width: srcWidth * 0.4,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 36.0),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget medicationTile(String name, String time) {
    return ListTile(
      title: Text(name),
      subtitle: Text(time),
    );
  }
}