import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/container.dart';
import 'package:reminder_app/components/searchfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/root_screen.dart';

class AllItems extends StatefulWidget {
  const AllItems({
    super.key,
  });
  static String id = 'allItems';

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    // Fetch all products when the widget is initialized
    // context.read<UserCubit>().allData();
    BlocProvider.of<UserCubit>(context).allData();
  }

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context)!.settings.arguments;
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is AddItemSuccess) {
          // Item added successfully, trigger a refresh to display the new item
          Navigator.pushReplacementNamed(context, AllItems.id,
              arguments: BlocProvider.of<UserCubit>(context).allData());
        }
        if (state is DeleteSuccess) {
          // Navigator.pushReplacementNamed(context, RootScreen.id,
          //     arguments: BlocProvider.of<UserCubit>(context).getUserProfile());
          // const ScaffoldMessenger(child: Text('Record has been deleted'));
          BlocProvider.of<UserCubit>(context).allData();
        }
        if (state is DeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 244, 243, 243),
            title: const Text(
              "All Items",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF295c82)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, RootScreen.id,
                    arguments:
                        BlocProvider.of<UserCubit>(context).getUserProfile());
              },
            ),
          ),
          body: state is AllProductsLoading
              ? const Center(child: CircularProgressIndicator())
              : state is AllProductsSuccess
                  ? CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12),
                                child: SearchField(),
                              ),
                              Column(
                                children: state.products.data.map((product) {
                                  return CustomContainer(
                                    product: product,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(),
        );
      },
    );
  }
}
