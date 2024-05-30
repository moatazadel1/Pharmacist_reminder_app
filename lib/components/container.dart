import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/models/all_products_model.dart';
import 'package:reminder_app/screens/edit.dart';

class CustomContainer extends StatelessWidget {
  final ProductModel product;

  const CustomContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: IntrinsicHeight(
        child: Container(
          // height: 140,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title: ${product.title}",
                          style: const TextStyle(fontSize: 20)),
                      Text("Type: ${product.type}",
                          style: const TextStyle(fontSize: 20)),
                      Text("Pro Date: ${product.proDate}",
                          style: const TextStyle(fontSize: 20)),
                      Text("Expire Date: ${product.expDate}",
                          style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Image.network(
                        product.itemImage,
                        height: 100,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.edit_square,
                              color: Color(0xFF295c82),
                              size: 24,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, Edit.id,
                                  arguments: product);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: GestureDetector(
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                onTap: () {
                                  context.read<UserCubit>().delete(product.id);
                                }),
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
      ),
    );
  }
}
