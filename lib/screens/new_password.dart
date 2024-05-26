import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/textformfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/log_in.dart';

class NewPass extends StatelessWidget {
  const NewPass({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password changed'),
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return LogIn();
            }),
          );
        } else if (state is ResetPasswordFailure) {
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
                  image: AssetImage("images/Typing.png"),
                  height: 250,
                  width: 250,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text("Enter New Password:",
                    style: TextStyle(
                        color: Color(0xFF7f8184),
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextForm(
                  hinttext: 'Enter New Password',
                  controller: context.read<UserCubit>().reset_Password,
                  label: ' New Password',
                  isDense: true,
                  obscureText: true,
                  suffixIcon: true,
                  myicon: const Icon(Icons.lock, color: Color(0xFF295c82)),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: CustomTextForm(
              //     hinttext: 'Enter Password again',
              //     controller: context.read<UserCubit>().reset_confirm,
              //     label: ' Confirm it',
              //     isDense: true,
              //     obscureText: true,
              //     suffixIcon: true,
              //     myicon: const Icon(Icons.lock, color: Color(0xFF5dadec)),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: state is ResetPasswordLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF295c82),
                          minimumSize: const Size(300, 50),
                        ),
                        onPressed: () {
                          context.read<UserCubit>().resetPass();
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return NewPass();
                          // }));
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
