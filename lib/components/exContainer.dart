import 'package:flutter/material.dart';

import 'package:reminder_app/models/expired_model.dart';
import 'package:reminder_app/screens/edit.dart';

class ExCustomContainer extends StatelessWidget {
  final ExpiredModel exproducts;

  ExCustomContainer({required this.exproducts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFF295c82)),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 10,
              offset: const Offset(15, 15),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title: ${exproducts.title}", style: TextStyle(fontSize: 20)),
                  Text("Type: ${exproducts.type}", style: TextStyle(fontSize: 20)),
                  Text("Pro Date: ${exproducts.proDate}", style: TextStyle(fontSize: 20)),
                  Text("Expire Date: ${exproducts.expDate}", style: TextStyle(fontSize: 20)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 110),
                child: Column(
                  children: [
                    Image.network(
                      exproducts.itemImage,
                      height: 5,
                      width: 5,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.edit_square,
                            color: Color(0xFF295c82),
                            size: 24,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return Edit();
                            }));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}