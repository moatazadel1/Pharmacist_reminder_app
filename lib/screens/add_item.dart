import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:reminder_app/components/textformfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/all_items.dart';
import 'package:reminder_app/widgets/pick_image2.dart';
import 'package:reminder_app/widgets/pick_image3.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _EditState();
}

int index = 2;

class _EditState extends State<Add> {
  bool _ischecked = false;
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  bool _ischecked3 = false;
  bool _ischecked4 = false;
  bool _ischecked5 = false;

  String getCategoryID() {
    if (_ischecked) {
      return "1"; // ID for "Pils"
    } else if (_ischecked1) {
      return "2"; // ID for "Syrub"
    } else if (_ischecked2) {
      return "3"; // ID for "Injections"
    } else if (_ischecked3) {
      return "4"; // ID for "Body care"
    } else if (_ischecked4) {
      return "5"; // ID for "Skin care"
    } else if (_ischecked5) {
      return "6"; // ID for "Hair care"
    } else {
      return ""; // No category selected
    }
  }

  void _resetForm() {
    context.read<UserCubit>().productName.clear();
    context.read<UserCubit>().proDate.clear();
    context.read<UserCubit>().expDate.clear();
    context.read<UserCubit>().startReminder.clear();
    context.read<UserCubit>().BatchNumber.clear();
    context.read<UserCubit>().quantity.clear();
    context.read<UserCubit>().description.clear();
    context.read<UserCubit>().category.clear();
    context.read<UserCubit>().productPic = null;

    setState(() {
      _ischecked = false;
      _ischecked1 = false;
      _ischecked2 = false;
      _ischecked3 = false;
      _ischecked4 = false;
      _ischecked5 = false;
    });

    context.read<UserCubit>().resetProductPic();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is AddItemSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("item added successfully"),
            ),
          );
          _resetForm(); // Reset form after successful add

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const AllItems();
            }),
          );
          context.read<UserCubit>().getUserProfile();
        } else if (state is AddItemFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 244, 243, 243),
            title: const Text(
              "Add Item",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            // leading: const BackButton(color: Color(0xFF295c82)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 270, top: 20),
                  child: Text(
                    "Tittle ",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                //prduct name
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTextForm(
                    hinttext: 'Add Product Name',
                    controller: context.read<UserCubit>().productName,
                  ),
                ),

                Row(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10),

                        //Pro Date
                        child: TextField(
                          controller: context.read<UserCubit>().proDate,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              labelText: "Pro Date "),
                          onTap: () async {
                            DateTime? pickeddate1 = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (pickeddate1 != null) {
                              setState(() {
                                context.read<UserCubit>().proDate.text =
                                    pickeddate1.toString().split(" ")[0];
                              });
                            }
                          },
                        ),
                      ),
                    ),

                    //Exp Date
                    SizedBox(
                      height: 70,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: context.read<UserCubit>().expDate,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              labelText: "Exp Date "),
                          onTap: () async {
                            DateTime? pickeddate1 = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (pickeddate1 != null) {
                              setState(() {
                                context.read<UserCubit>().expDate.text =
                                    pickeddate1.toString().split(" ")[0];
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10),

                        //Reminder
                        child: TextField(
                          controller: context.read<UserCubit>().startReminder,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              labelText: "Start Reminder "),
                          onTap: () async {
                            DateTime? pickeddate1 = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (pickeddate1 != null) {
                              setState(() {
                                context.read<UserCubit>().startReminder.text =
                                    pickeddate1.toString().split(" ")[0];
                              });
                            }
                          },
                        ),
                      ),
                    ),

                    //Batch Number
                    SizedBox(
                      height: 70,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: context.read<UserCubit>().BatchNumber,
                          decoration: const InputDecoration(
                            labelText: 'Batch Number',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  SizedBox(
                    height: 70,
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: context.read<UserCubit>().quantity,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.production_quantity_limits),
                          labelText: 'Quantity',
                        ),
                      ),
                    ),
                  ),
                ]),

                //description
                const Padding(
                  padding: EdgeInsets.only(right: 250),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                      controller: context.read<UserCubit>().description,
                      minLines: 1,
                      maxLines: 4,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF295c82)),
                            borderRadius: BorderRadius.circular(16),
                          ))),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 250),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 155,
                        child: CheckboxListTile(
                          title: const Text(
                            "Pils",
                            style: TextStyle(fontSize: 15),
                          ),
                          activeColor: const Color(0xFF295c82),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          tristate: false,
                          value: _ischecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _ischecked = newValue!;
                              // Reset other checkboxes
                              _ischecked1 = false;
                              _ischecked2 = false;
                              _ischecked3 = false;
                              _ischecked4 = false;
                              _ischecked5 = false;
                              if (_ischecked) {
                                context.read<UserCubit>().category.text = "1";
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 150,
                        child: CheckboxListTile(
                          title: const Text(
                            "Syrub",
                            style: TextStyle(fontSize: 15),
                          ),
                          activeColor: const Color(0xFF295c82),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          tristate: false,
                          value: _ischecked1,
                          onChanged: (bool? newValue1) {
                            setState(() {
                              _ischecked1 = newValue1!;
                              // Reset other checkboxes
                              _ischecked = false;
                              _ischecked2 = false;
                              _ischecked3 = false;
                              _ischecked4 = false;
                              _ischecked5 = false;
                              if (_ischecked1) {
                                context.read<UserCubit>().category.text = "2";
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 155,
                        child: CheckboxListTile(
                          title: const Text(
                            "Injections",
                            style: TextStyle(fontSize: 15),
                          ),
                          activeColor: const Color(0xFF295c82),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          tristate: false,
                          value: _ischecked2,
                          onChanged: (bool? newValue2) {
                            setState(() {
                              _ischecked2 = newValue2!;
                              // Reset other checkboxes
                              _ischecked = false;
                              _ischecked1 = false;
                              _ischecked3 = false;
                              _ischecked4 = false;
                              _ischecked5 = false;
                              if (_ischecked2) {
                                context.read<UserCubit>().category.text = "3";
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 160,
                        child: CheckboxListTile(
                          title: const Text(
                            "Body care ",
                            style: TextStyle(fontSize: 15),
                          ),
                          activeColor: const Color(0xFF295c82),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          tristate: false,
                          value: _ischecked3,
                          onChanged: (bool? newValue3) {
                            setState(() {
                              _ischecked3 = newValue3!;
                              // Reset other checkboxes
                              _ischecked = false;
                              _ischecked1 = false;
                              _ischecked2 = false;
                              _ischecked4 = false;
                              _ischecked5 = false;
                              if (_ischecked3) {
                                context.read<UserCubit>().category.text = "4";
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 155,
                        child: CheckboxListTile(
                          title: const Text(
                            "Skin care",
                            style: TextStyle(fontSize: 15),
                          ),
                          activeColor: const Color(0xFF295c82),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          tristate: false,
                          value: _ischecked4,
                          onChanged: (bool? newValue4) {
                            setState(() {
                              _ischecked4 = newValue4!;
                              // Reset other checkboxes
                              _ischecked = false;
                              _ischecked1 = false;
                              _ischecked2 = false;
                              _ischecked3 = false;
                              _ischecked5 = false;
                              if (_ischecked4) {
                                context.read<UserCubit>().category.text = "5";
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 150,
                        child: CheckboxListTile(
                          title: const Text(
                            "Hair care",
                            style: TextStyle(fontSize: 15),
                          ),
                          activeColor: const Color(0xFF295c82),
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          tristate: false,
                          value: _ischecked5,
                          onChanged: (bool? newValue5) {
                            setState(() {
                              _ischecked5 = newValue5!;
                              // Reset other checkboxes
                              _ischecked = false;
                              _ischecked1 = false;
                              _ischecked2 = false;
                              _ischecked3 = false;
                              _ischecked4 = false;
                              if (_ischecked5) {
                                context.read<UserCubit>().category.text = "6";
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(right: 220, top: 20),
                  child: Text(
                    "Add Photo",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 5, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Image from gallery
                      PickImageGallery(),
                      //Image from camera
                      PickImagecamera(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("please select an image"),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: state is AddItemLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          title: "Add",
                          onPressed: () {
                            context.read<UserCubit>().addItem();
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Future _pickImageFromGalary() async {
  //   final returnedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (returnedImage == null) return;
  //   setState(() {
  //     _selectedImage = File(returnedImage!.path);
  //   });
  // }

  // Future _pickImageFromCamera() async {
  //   final returnedImage =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (returnedImage == null) return;
  //   setState(() {
  //     _selectedImage = File(returnedImage!.path);
  //   });
  // }
}


  // Future<void> _refresh() {
  //   return Future.delayed(const Duration(seconds: 0));
  // }


          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: (value) {
          //     setState(() {
          //       index = value;
          //       if (index == 0) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const HomePage();
          //         }));
          //       } else if (index == 1) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const Calender();
          //         }));
          //       } else if (index == 2) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const Add();
          //         }));
          //       } else if (index == 3) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const Settings();
          //         }));
          //       }
          //     });
          //   },
          //   currentIndex: 2,
          //   unselectedFontSize: 15,
          //   unselectedItemColor: Colors.grey,
          //   selectedItemColor: const Color(0xFF295c82),
          //   selectedLabelStyle: const TextStyle(fontSize: 13),
          //   items: [
          //     const BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         label: "Home",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //     const BottomNavigationBarItem(
          //         icon: Icon(Icons.calendar_month),
          //         label: "Calender",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //     const BottomNavigationBarItem(
          //         icon: Icon(Icons.add),
          //         label: "Add",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //     const BottomNavigationBarItem(
          //         icon: Icon(Icons.settings),
          //         label: "Settings",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //   ],
          // ),
