import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mime/mime.dart';
import 'package:r4everstore/widgets/custom_video_player.dart';

class UploadImage extends StatelessWidget {
  final dynamic imageFile;
  final VoidCallback onTap;
  const UploadImage({super.key, required this.onTap, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageFile == null || imageFile == '' || (imageFile is File && imageFile!.path.isEmpty) ? 150 : null,
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [4],
          radius: const Radius.circular(10),
          child: imageFile == null || imageFile == '' || (imageFile is File && imageFile!.path.isEmpty)
              ? const Center(child: Icon(Icons.image_outlined))
              : Center(child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
              child: imageFile is File && lookupMimeType(imageFile.path)!.contains('image')
                  ? Image.file(imageFile!, fit: BoxFit.cover)
                  : imageFile is! File && lookupMimeType(Uri.parse(imageFile).path)!.contains('image')
                  ? Image.network(imageFile!, fit: BoxFit.cover)
                  : Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CustomVideoPlayer(link: imageFile),
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
                          ),
                          child: const Icon(Icons.upload, color: Colors.white),
                        ),
                      )
                    ],
                  ),
          ),
          ),
        ),
      ),
    );
  }
}
