import 'dart:io';
import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/features/userInfo/driverInfo/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:delvirick/utils/routes/go_router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class DriverInfoImageView extends StatefulWidget {
  const DriverInfoImageView({super.key});

  @override
  State<DriverInfoImageView> createState() => _DriverInfoImageViewState();
}

class _DriverInfoImageViewState extends State<DriverInfoImageView> {
  final ImagePicker picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/image3.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 65,
                    left: 25,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 14,
                        ),
                        minimumSize: const Size(48, 48),
                        backgroundColor: const Color(0xffF7F5ED),
                        foregroundColor: const Color(0xffA97B3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back, size: 40),
                    ),
                  ),

                  Positioned(
                    top: 128,
                    left: 25,
                    right: 0,
                    child: const Text(
                      'Upload Your Photo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 185,
                    left: 25,
                    right: 0,
                    child: const Text(
                      'A clear photo helps customers and restaurants\nrecognize you',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff7A7A7A),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                spacing: 30,
                children: [
                  image != null
                      ? Column(
                        spacing: 5,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.file(
                                  fit: BoxFit.cover,
                                  File(image!.path),
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Positioned(
                                top: -10,
                                right: -10,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4DEB64),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Great photo! 📸',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff10B981),
                            ),
                          ),
                          Text(
                            'You look professional and friendly',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff7A7A7A),
                            ),
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            height: 42,
                            width: 220,
                            child: CustomElevatedButton(
                              backgroundColor: Color(0xff10B981),
                              onPressed: () {
                                customModalBottomSheet(context, picker, (
                                  imageFile,
                                ) {
                                  setState(() {
                                    image = imageFile;
                                  });
                                });
                              },
                              child: Text(
                                'Choose different photo',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            customModalBottomSheet(context, picker, (
                              imageFile,
                            ) {
                              setState(() {
                                image = imageFile;
                              });
                            });
                          },
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              color: Color(0xffD1FAE5),
                              strokeWidth: 2,
                              radius: Radius.circular(24),
                              dashPattern: [4, 4],
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 215,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/upload.png',
                                    height: 70,
                                    width: 70,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Upload your photo',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Drag and drop or click to browse',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff7A7A7A),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'JPG, PNG up to 5MB',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff7A7A7A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Photo Guidelines:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              '• Face clearly visible and well-lit\n'
                              '• Professional appearance\n'
                              '• No sunglasses or face coverings',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff7A7A7A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (image == null)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  CustomElevatedButton(
                    backgroundColor: Color(0xff10B981),
                    onPressed: () {
                      GoRouter.of(context).push(Routers.driverInfoPassprot);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
