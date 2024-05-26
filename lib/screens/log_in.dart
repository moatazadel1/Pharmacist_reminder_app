import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/buttons.dart';
import 'package:reminder_app/components/textformfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/profile.dart';
import 'package:reminder_app/screens/reset_password.dart';
import 'package:reminder_app/screens/sign_up.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  //GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('success'),
            ),
          );
          context
              .read<UserCubit>()
              .getUserProfile(); //علشان يعرض الداتا في البروفايل قبل مايروح للصفحة الرئيسية
              //context.read<UserCubit>().allData();
              // context.read<UserCubit>().expiredData();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return HomePage();
            }),
          );
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errmessage)));
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
              key: signInFormKey,
              child: Column(children: [
                Center(
                  child: Image(
                    image: AssetImage("images/log_in.png"),
                    height: 250,
                    width: 250,
                  ),
                ),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextForm(
                    hinttext: 'Email',
                    controller: context.read<UserCubit>().signInEmail,
                    label: 'Email',
                    myicon: Icon(Icons.mail, color: Color(0xFF295c82)),
                  ),
                ),

                //password form
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: CustomTextForm(
                    hinttext: 'Password',
                    controller: context.read<UserCubit>().signInPassword,
                    label: 'Password',
                    isDense: true,
                    obscureText: true,
                    suffixIcon: true,
                    myicon: Icon(Icons.lock, color: Color(0xFF295c82)),
                  ),
                ),

                //Forget Password?
                Padding(
                  padding: const EdgeInsets.only(right: 175, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ResetPassword();
                      }));
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Color(0xFF295c82), fontSize: 19),
                    ),
                  ),
                ),

                //button
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: state is SignInLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                          title: "Login",
                          onPressed: () {
                            context.read<UserCubit>().signIn();
                          },
                        ),
                ),

                //divider
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xFF7f8184),
                        thickness: 2,
                        indent: 30,
                        endIndent: 10,
                        height: 25,
                      ),
                    ),
                    Text("Or Login With:",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF7f8184),
                            fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Divider(
                        color: Color(0xFF7f8184),
                        thickness: 2,
                        indent: 10,
                        endIndent: 30,
                        height: 25,
                      ),
                    ),
                  ],
                ),

                //images
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image(
                        image: AssetImage("images/google.png"),
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: InkWell(
                        child: Image(
                          image: AssetImage("images/apple.png"),
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Image(
                        image: AssetImage("images/facebook.png"),
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),

                //text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an Account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUP();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style:
                            TextStyle(color: Color(0xFF295c82), fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
