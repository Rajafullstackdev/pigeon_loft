import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/custtomIconButton/customIconButton.dart';

class pigeonInfoController extends GetxController{

  Rx<List<File>> imageList = Rx<List<File>>([]);




  /// Function to pick image
  imagePickerFucn({pickOption}) async {
    final picker = ImagePicker();
    await picker
        .pickImage(
        source: pickOption == imgOptionCamera
            ? ImageSource.camera
            : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        imageList.value = List.from(imageList.value)..add(File(value.path));
      }
    });

    print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    print(imageList.value);
    print('}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}');
    Get.back();
    update();
  }

  ///List Clear Function
  clearList(){
    imageList.value=[];
    update();

  }

  /// Select file pick method (opens dialog to pick image)
  selectTypeFilePick({context}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: CustomContainer(
                height: 180,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Custometext(
                      textName: 'Please Select One',
                      textStyle: fontsValue.fontstyleAboreto(
                          fontColor: spbgColor,
                          fontSize: medium,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imagePickerFucn(pickOption: imgOptionGallery);
                            });
                          },
                          child: Column(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomContainer(
                                height: 70,
                                width: 70,
                                elevation: 12,
                                shadowColor: Colors.black12,
                                innerColor: spbgColor,
                                outColor: spbgColor,
                                child: custtomIconButton(
                                  outterColor: spbgColor,
                                  icon: CupertinoIcons.photo_fill,
                                  iconColor: whiteColor,
                                ),
                              ),
                              Custometext(
                                textName: 'Gallery',
                                textStyle: fontsValue.fontstyleAboreto(
                                  fontColor: spbgColor,
                                  fontSize: small,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imagePickerFucn(pickOption: imgOptionCamera);
                            });
                          },
                          child: Column(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomContainer(
                                height: 70,
                                width: 70,
                                elevation: 12,
                                shadowColor: Colors.black12,
                                innerColor: spbgColor,
                                outColor: spbgColor,
                                child: custtomIconButton(
                                  outterColor: spbgColor,
                                  icon: CupertinoIcons.photo_camera_solid,
                                  iconColor: whiteColor,
                                ),
                              ),
                              Custometext(
                                textName: 'Camera',
                                textStyle: fontsValue.fontstyleAboreto(
                                  fontColor: spbgColor,
                                  fontSize: small,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}