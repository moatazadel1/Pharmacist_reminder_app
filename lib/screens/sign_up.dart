import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/buttons.dart';
import 'package:reminder_app/components/textformfield.dart';
import 'package:reminder_app/core/api/end_points.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/log_in.dart';
import 'package:reminder_app/widgets/pick_image_widget.dart';

class SignUP extends StatelessWidget {
  SignUP({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(color: Color(0xFF295c82)),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: signUpFormKey,
              child: Column(
                children: [
                  //! Image
                  const PickImageWidget(),
                  const SizedBox(height: 16),

                  //user name
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextForm(
                      hinttext: 'User Name',
                      controller: context.read<UserCubit>().signUpName,
                      label: 'User Name',
                      validator: (val) {
                        if (val == '') {
                          return "Can't Be Empty";
                        }
                      },
                      myicon: Icon(Icons.person, color: Color(0xFF295c82)),
                    ),
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextForm(
                      hinttext: 'Email',
                      controller: context.read<UserCubit>().signUpEmail,
                      label: 'Email',
                      validator: (val) {
                        if (val == '') {
                          return "Can't Be Empty";
                        }
                      },
                      myicon: Icon(Icons.mail, color: Color(0xFF295c82)),
                    ),
                  ),

                  //password
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextForm(
                      hinttext: 'Password',
                      controller: context.read<UserCubit>().signUpPassword,
                      label: 'Password',
                      validator: (val) {
                        if (val == '') {
                          return "Can't Be Empty";
                        }
                      },
                      isDense: true,
                      suffixIcon: true,
                      obscureText: true,
                      myicon: Icon(Icons.lock, color: Color(0xFF295c82)),
                    ),
                  ),

                  //confirm password
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextForm(
                      hinttext: 'Confirm Password',
                      controller: context.read<UserCubit>().confirmPassword,
                      label: 'Confirm Password',
                      validator: (val) {
                        if (val == '') {
                          return "Can't Be Empty";
                        }
                      },
                      isDense: true,
                      suffixIcon: true,
                      obscureText: true,
                      myicon: Icon(Icons.lock, color: Color(0xFF295c82)),
                    ),
                  ),

                  //button
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: state is SignUpLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            title: "Create Acount",
                            onPressed: () {
                              context.read<UserCubit>().signUp();
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(builder: (context) {
                              //     return LogIn();
                              //   }),
                              // );
                            },
                          ),
                  ),

                  //text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an Account..."),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LogIn();
                          }));
                        },
                        child: Text(
                          "LogIn",
                          style:
                              TextStyle(color: Color(0xFF295c82), fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
