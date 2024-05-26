import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/new_password.dart';

class CodeReset extends StatelessWidget {
  const CodeReset({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is CheckCodeSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('success'),
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const NewPass();
            }),
          );
        } else if (state is CheckCodeFailure) {
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
          body: state is ForgetPassLoading
              ? CircularProgressIndicator()
              : state is ForgetPassSuccess
                  ? SingleChildScrollView(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //text1

                              const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Get a verification code",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                  ),
                                ),
                              ),

                              //text2

                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "A text message with a 5-digit verification code was just sent to your email. ",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 92, 92, 92),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 30),
                                child: OtpTextField(
                                  numberOfFields: 5,
                                  borderColor: Color(0xFF295c82),
                                  //set to true to show as box or false to show as dash
                                  showFieldAsBox: true,
                                  //runs when a code is typed in
                                  onCodeChanged: (String code) {
                                    //handle validation or checks here
                                  },
                                  //runs when every textfield is filled
                                  onSubmit: (String verificationCode) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Verification Code"),
                                            content: Text(
                                                'Code entered is $verificationCode'),
                                          );
                                        });
                                  }, // end onSubmit
                                  handleControllers:
                                      (List<TextEditingController?>?
                                          controllers) {
                                    if (controllers != null &&
                                        controllers.isNotEmpty) {
                                      controllers[0] =
                                          context.read<UserCubit>().check_Code;
                                    }
                                  },
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              Center(
                                child: state is ForgetPassLoading
                                    ? CircularProgressIndicator()
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          backgroundColor: Color(0xFF295c82),
                                          minimumSize: Size(210, 49),
                                        ),
                                        onPressed: () {
                                          context.read<UserCubit>().checkCode();
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(builder: (context) {
                                          //   return NewPass();
                                          // }));
                                        },
                                        child: const Text(
                                          "Submit",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  : Container(),
        );
      },
    );
  }
}

// TextField(
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.all(20),
//                     labelText: 'The Code',
//                     prefixIcon: const Icon(Icons.lock,color: Color(0xFF5DADEC),),
//                     prefixIconColor: const Color(0xFF5DADEC),
//                     hintText: 'Enter Your Code',
//                     hintStyle: const TextStyle(color: Color(0xFF5DADEC)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: const BorderSide(color: Colors.green),
//                     ),
//                   ),
//                 ),
