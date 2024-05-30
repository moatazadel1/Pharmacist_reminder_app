import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/cache/cache_helper.dart';
import 'package:reminder_app/components/buttons.dart';
import 'package:reminder_app/components/textformfield.dart';
import 'package:reminder_app/core/api/end_points.dart';
import 'package:reminder_app/core/functions/constant.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/root_screen.dart';
import 'package:reminder_app/screens/reset_password.dart';
import 'package:reminder_app/screens/sign_up.dart';
import 'package:reminder_app/service/service_Locator.dart';

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
            const SnackBar(
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
              return const RootScreen();
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
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: signInFormKey,
              child: Column(children: [
                const Center(
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
                    myicon: const Icon(Icons.mail, color: Color(0xFF295c82)),
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
                    myicon: const Icon(Icons.lock, color: Color(0xFF295c82)),
                  ),
                ),

                //Forget Password?
                Padding(
                  padding: const EdgeInsets.only(right: 175, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ResetPassword();
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
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          title: "Login",
                          onPressed: () {
                            context.read<UserCubit>().signIn();
                            getIt<CacheHelper>()
                                .saveData(key: ApiKey.token, value: token);
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
                    const Text("Don't Have an Account?"),
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
                      child: const Text(
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
