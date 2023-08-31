import 'package:flutter/material.dart';
import 'package:smart_home_ui/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horzontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartDevices = [
    ["Smart Light", "assets/icons/lightbulb.png", true],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              // padding: const EdgeInsets.only(left: 25,right: 25),
              padding: EdgeInsets.symmetric(
                  horizontal: horzontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 45,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "SMART HOME",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horzontalPadding),
              child: Center(
                child: Text(
                  "Smart Devices",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
              itemCount: mySmartDevices.length,
              padding: EdgeInsets.all(25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  iconPath: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
