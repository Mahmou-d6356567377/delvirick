import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:delvirick/core/widgets/custom_elevated_button.dart';

void customModalBottomSheet(
  BuildContext context,
  ImagePicker picker,
  Function(File) onImagePicked,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    builder:
        (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffECECED),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.photo_camera_outlined,
                        color: Color(0xff007AFF),
                        size: 30,
                      ),
                      title: const Text(
                        'Take Photo',
                        style: TextStyle(
                          color: Color(0xff007AFF),
                          fontSize: 20,
                        ),
                      ),
                      onTap: () async {
                        Navigator.pop(context);
                        final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.camera,
                        );
                        if (pickedFile != null) {
                          onImagePicked(File(pickedFile.path));
                        }
                      },
                    ),
                    const Divider(color: Color(0xffC6C6C8)),
                    ListTile(
                      leading: const Icon(
                        Icons.photo_library_outlined,
                        color: Color(0xff007AFF),
                        size: 30,
                      ),
                      title: const Text(
                        'Photo Gallery',
                        style: TextStyle(
                          color: Color(0xff007AFF),
                          fontSize: 20,
                        ),
                      ),
                      onTap: () async {
                        final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedFile != null) {
                          onImagePicked(File(pickedFile.path));
                        }
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CustomElevatedButton(
                backgroundColor: const Color(0xffECECED),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color(0xff007AFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
