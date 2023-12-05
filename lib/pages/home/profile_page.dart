import 'package:duckduck/widgets/confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/authentication_provider.dart';
import '../authentication/login_page.dart';

class ImageInput extends StatefulWidget {
  final String image;
  final String? notDeleteable;
  final double radius;
  final Function(String)? onChanged;
  final bool readOnly;
  final bool showLoadingStatus;
  final bool showBorder;
  const ImageInput(
      {Key? key,
      required this.image,
      this.notDeleteable,
      this.onChanged,
      this.radius = 120.0,
      this.readOnly = false,
      this.showLoadingStatus = true,
      this.showBorder = false})
      : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  late Future<String?> imageURL;

  Future<String?> _getImageURL() async {
    // return Future.value(await FirebaseStorage.instance
    //     .refFromURL(widget.image)
    //     .getDownloadURL());
    return Future.value(widget.image);
  }

  Future<void> _handleInput() async {
    // FilePickerResult? result =
    //     await FilePicker.platform.pickFiles(type: FileType.image);
    // if (result != null) {
    //   File file = File(result.files.single.path!);
    //   Uint8List fileBytes = await file.readAsBytes();
    //   if (defaultTargetPlatform == TargetPlatform.iOS ||
    //       defaultTargetPlatform == TargetPlatform.android) {
    //     fileBytes = await FlutterImageCompress.compressWithList(
    //       fileBytes,
    //       minHeight: 1920,
    //       minWidth: 1080,
    //     );
    //   }
    //   const uuid = Uuid();
    //   while (true) {
    //     String fileName = uuid.v1();
    //     String path = 'gs://cs21-voto.appspot.com/uploads/$fileName';
    //     try {
    //       await FirebaseStorage.instance.refFromURL(path).getDownloadURL();
    //       debugPrint('duplicate filename exists, getting a new name...');
    //     } on FirebaseException catch (e) {
    //       if (e.code == 'object-not-found') {
    //         await FirebaseStorage.instance.refFromURL(path).putData(fileBytes);
    //         widget.onChanged?.call(path);
    //         break;
    //       }
    //     }
    //   }
    // }
  }

  Future<void> _deletePreviousImage(String? previousImage) async {
    /***
     * Delete previousImage if not in /dummy folder
     */
    // if (widget.readOnly || previousImage == widget.notDeleteable) return;
    // if (previousImage != null && previousImage.split('/')[3] != 'dummy') {
    //   FirebaseStorage.instance.refFromURL(previousImage).delete();
    // }
  }

  @override
  void initState() {
    super.initState();
    imageURL = _getImageURL();
  }

  @override
  Widget build(BuildContext context) {
    double position =
        widget.radius * 0.70710678118; // equals radius * sin(pi/4)
    double size = position + widget.radius / 3;

    return SizedBox(
      width: size,
      height: size,
      child: FutureBuilder(
          future: imageURL,
          builder: (context, snapshot) {
            final bool isLoaded = snapshot.hasData;
            final String? imageURL = snapshot.data as String?;
            return Stack(children: [
              CircleAvatar(
                radius: widget.radius,
                backgroundColor: DuckDuckColors.metalBlue,
                child: CircleAvatar(
                    backgroundImage:
                        isLoaded ? NetworkImage('$imageURL') : null,
                    child: isLoaded || !widget.showLoadingStatus
                        ? null
                        : const CircularProgressIndicator(),
                    backgroundColor: DuckDuckColors.skyBlue,
                    radius: widget.radius - 2),
              ),
              widget.readOnly
                  ? Container()
                  : Positioned(
                      top: position,
                      left: position,
                      child: Container(
                          height: widget.radius / 3,
                          width: widget.radius / 3,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: DuckDuckColors.skyBlue,
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              iconSize: widget.radius / 6,
                              onPressed: _handleInput,
                              color: DuckDuckColors.frostWhite,
                            ),
                          ))),
            ]);
          }),
    );
  }
}

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
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                          color: DuckDuckColors.steelBlack,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        try {
                          await authProvider.logout();
                          const SnackBar(
                              content: Text("Logged out successfully!"));
                          // Optional: Redirect user to login page after logging out
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              ModalRoute.withName('/'));
                        } catch (error) {
                          // Handle any logout error (if necessary)
                          SnackBar(content: Text("Error logging out: $error"));
                        }
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: DuckDuckColors.steelBlack,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              ImageInput(image: "https://picsum.photos/id/237/300"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            // SizedBox(width: 30),
                            Text(
                              'Tanny Panitnun',
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: DuckDuckColors.steelBlack,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.edit,
                              size: 20,
                              color: DuckDuckColors.skyBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Email',
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: DuckDuckColors.steelBlack),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 353,
                          height: 60,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.00),
                            color: DuckDuckStatus.disabled,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.email_rounded,
                                color: DuckDuckStatus.disabledForeground,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${authProvider.currentUser?.email}',
                                style: GoogleFonts.rubik(
                                    color: DuckDuckStatus.disabledForeground),
                              )
                            ],
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 350),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ConfirmButton(
                          confirmText: 'Save',
                          onConfirm: () {},
                          onCancel: () {},
                        ),
                      ),
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
