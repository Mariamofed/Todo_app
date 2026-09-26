import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  // ignore: non_constant_identifier_names
  final TextEditingController Controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Frame 43.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Missions',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 108),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Missions',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      SvgPicture.asset('assets/images/waving_hand.svg'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your productivity journey starts here.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  SvgPicture.asset(
                    'assets/images/pana.svg',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please Enter Your Full Name";
                            }
                            return null;
                          },
                          controller: Controller,
                          decoration: InputDecoration(
                            hintText: 'e.g. name',
                            hintStyle: TextStyle(color: Color(0xFF6D6D6D)),
                            filled: true,
                            fillColor: Color(0xFF282828),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState?.validate() ?? false) {
                        final pref = await SharedPreferences.getInstance();
                        pref.setString('username', Controller.value.text);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomeScreen(name: Controller.value.text);
                            },
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF15B86C),
                      fixedSize: Size(370, 40),
                    ),
                    child: Text(
                      'Let’s Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
