import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/textformfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/code_reset.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ForgetPassSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Code sent successfully'),
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const CodeReset();
            }),
          );
        } else if (state is ForgetPassFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const BackButton(color: Color(0xFF295c82)),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const Center(
                child: Image(
                  image: AssetImage("images/Forgot.png"),
                  height: 250,
                  width: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //text1

                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Forget Password?",
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
                        "Don't Worry sometimes people can forget it too ,Enter your email and we will send you a password reset code ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 114, 114, 114),
                          fontSize: 14,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      child: CustomTextForm(
                        hinttext: 'Email',
                        controller: context.read<UserCubit>().forgetPassword,
                        label: 'Email',
                        myicon:
                            const Icon(Icons.mail, color: Color(0xFF295c82)),
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
                                    borderRadius: BorderRadius.circular(18)),
                                backgroundColor: const Color(0xFF295c82),
                                minimumSize: const Size(210, 49),
                              ),
                              onPressed: () {
                                context.read<UserCubit>().forgetPass();
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const CodeReset();
                                // }));
                              },
                              child: const Text(
                                "SendCode",
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
          ),
        );
      },
    );
  }
}
