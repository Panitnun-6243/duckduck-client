import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  // late final DatabaseReference _userRef;
  late String userImages;
  late String initialName;
  late String initialImage;
  String? displayName;
  String? email;
  String? image;
  bool isSaved = false;

  // Future<void> _updateImage(String path) async {
  //   userImages = path;
  //   await _userRef.update({"image": path});
  // }

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                color: DuckDuckColors.frostWhite,
                padding: EdgeInsets.only(left: 18, top: 15),
                child: Row(
                  children: [
                    Text(
                      'Profile',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          color: DuckDuckColors.steelBlack,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Stack(
                  alignment:
                      Alignment.center, // Center the Stack within its parent
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: DuckDuckColors.metalBlue),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2023/10/03/08/24/goose-8290811_1280.jpg'),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .end, // Align the Row to the end (right)
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: DuckDuckColors.metalBlue,
                            ),
                            color: DuckDuckColors.frostWhite,
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: DuckDuckColors.metalBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: DuckDuckColors.frostWhite),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                letterSpacing: 2,
                                color: DuckDuckColors.skyBlue,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: DuckDuckColors.skyBlue,
                            ),
                            child: Text(
                              'Save',
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                letterSpacing: 2,
                                color: DuckDuckColors.frostWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
