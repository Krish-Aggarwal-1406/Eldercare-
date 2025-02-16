import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'EmergencyScreen.dart';
import 'NotificationsScreens.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, String>> medications = [
    {"name": "Paracetamol", "time": "8:00 AM - 10mg"},
    {"name": "Levocetirizine", "time": "2:00 PM - 500mg"},
    {"name": "Simvastatin", "time": "8:00 PM - 20mg"},
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController doseController = TextEditingController();

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
                        "Welcome back, John",
                        style: TextStyle(
                          fontSize: srcWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Caregiver",
                        style: TextStyle(
                          fontSize: srcWidth * 0.035,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(),));
                  }, icon: Icon(Icons.notifications, size: srcWidth * 0.08),)

                ],
              ),
              SizedBox(height: 16.0),



              Center(
                child: SizedBox(
                  width: srcWidth * 0.9,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyAlertScreen(),));
                    },
                    icon: Icon(Icons.warning_amber_outlined, color: Colors.white),
                    label: Text(
                      "Emergency SOS",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              Text(
                "Health Overview",
                style: TextStyle(
                  fontSize: srcWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  healthContainer(srcWidth, "Heart Rate", "75 BPM", Icons.favorite, Colors.red),
                  healthContainer(srcWidth, "Blood Pressure", "120/80", Icons.water, Colors.blue),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  healthContainer(srcWidth, "Blood Sugar", "95 mg/dL", Icons.bloodtype, Colors.orange),
                  healthContainer(srcWidth, "Steps", "2,450", Icons.directions_walk, Colors.green),
                ],
              ),
              const SizedBox(height: 16.0),


              Row(
                children: [
                  Text(
                    "Today's Medications",
                    style: TextStyle(
                      fontSize: srcWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: srcWidth*0.35),
                    child: IconButton(onPressed: (){
                      _showAddMedicationDialog(context);
                    }, icon: Icon(Icons.add)),
                  )
                ],
              ),
              const SizedBox(height: 12.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: Column(
                  children: medications.map((medication) {
                    return _medicationTile(
                      context,
                      medication["name"]!,
                      medication["time"]!,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),

              Text(
                "Current Location",
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
                    Image.asset('assets/images/map.png',fit: BoxFit.contain,),
                    ListTile(
                      title: Text("Last updated: 2 mins ago"),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text("Track Now"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              Text(
                "Upcoming Appointments",
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
                    appointmentTile("Dr. Smith - Cardiology", "Today, 2:30 PM - Medical Center"),
                    Divider(height: 1.0),
                    appointmentTile("Physical Therapy", "Tomorrow, 10:00 AM - Wellness Center"),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMedicationDialog(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }


  Widget _medicationTile(BuildContext context, String name, String time) {
    return ListTile(
      title: Text(name),
      subtitle: Text(time),
    );
  }

  void _showAddMedicationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add New Medication Reminder", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: "Medication Name"),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: timeController,
                      decoration: InputDecoration(labelText: "Time (e.g., 8:00 AM)"),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: doseController,
                      decoration: InputDecoration(labelText: "Dose (e.g., 10mg)"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          medications.add({
                            "name": nameController.text,
                            "time": "${timeController.text} - ${doseController.text}",
                          });
                        });
                        Navigator.pop(context);
                        nameController.clear();
                        timeController.clear();
                        doseController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left:5,right: 5),
                        child: Text("Add Reminder"),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget appointmentTile(String title, String details) {
    return ListTile(
      title: Text(title),
      subtitle: Text(details),
    );
  }


  void openNotificationDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: List.generate(10, (index) {
            return ListTile(
              title: Text("Notification ${index + 1}"),
              subtitle: Text("This is a dummy notification."),
            );
          }),
        );
      },
    );
  }
}