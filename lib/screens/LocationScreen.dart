import 'package:flutter/material.dart';

class LocationTrackingScreen extends StatelessWidget {
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
                        "Location Tracking",
                        style: TextStyle(
                          fontSize: srcWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Track Care Receiver",
                        style: TextStyle(
                          fontSize: srcWidth * 0.035,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.location_on, size: srcWidth * 0.08),
                ],
              ),
              SizedBox(height: 16.0),

              // Location Update Section
              Center(
                child: SizedBox(
                  width: srcWidth * 0.9,
                  child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    icon: Icon(Icons.refresh, color: Colors.white),
                    label: Text(
                      "Refresh Location",
                      style: TextStyle(color: Colors.white),
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
              ),
              const SizedBox(height: 16.0),

              // Map Placeholder Section
              Text(
                "Current Location",
                style: TextStyle(
                  fontSize: srcWidth * 0.05,
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
                    ClipRRect(child: Image.asset('assets/images/map2.png')),
                    ListTile(
                      title: Text("Last updated: 5 mins ago"),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text("Track Now",),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Location History Section
              Text(
                "Location History",
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
                    locationHistoryTile("Location 1", "Near the park, 2:00 PM"),
                    Divider(height: 1.0),
                    locationHistoryTile("Location 2", "Hospital area, 10:30 AM"),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  // Location History Tile
  Widget locationHistoryTile(String title, String details) {
    return ListTile(
      title: Text(title),
      subtitle: Text(details),
    );
  }
}