import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';

class PickImageGallery extends StatelessWidget {
  const PickImageGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          
          height: 70,
          child: context.read<UserCubit>().productPic == null
              ? ElevatedButton(
                  onPressed: () {
                    ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) => context
                                        .read<UserCubit>()
                                        .uploadProductPic(value!));
                  },
                  child: const Text(
                    "add from gallery",
                    style: TextStyle(fontSize: 12, color: Color((0xFF295c82))),
                  ),
                )
              : CircleAvatar(
                  backgroundImage: FileImage(
                      File(context.read<UserCubit>().productPic!.path)),
                ),
        );
      },
    );
  }
}