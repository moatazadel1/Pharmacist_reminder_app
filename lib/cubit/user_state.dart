import 'package:flutter/material.dart';
import 'package:reminder_app/models/add_model.dart';
import 'package:reminder_app/models/all_products_model.dart';
import 'package:reminder_app/models/delete_product_model.dart';
import 'package:reminder_app/models/edit_user_model.dart';
import 'package:reminder_app/models/expired_model.dart';
import 'package:reminder_app/models/log_out_model.dart';
import 'package:reminder_app/models/showone_model.dart';
import 'package:reminder_app/models/soonexpired.dart';
import 'package:reminder_app/models/update_item_model.dart';
import 'package:reminder_app/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

//signIn
final class SignInSuccess extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errmessage;

  SignInFailure({required this.errmessage});
}

//uploadImage
final class UploadProfilePic extends UserState {}

//uploadImage
final class UploadProductPic extends UserState {}

final class UserImageReset extends UserState {}

//signUp
final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

//Profile=getuser
final class GetUserSuccess extends UserState {
  final UserModel user;
  // final AllProductsModel products;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}

//LogOut
final class LogOutSuccess extends UserState {}

final class LogOutLoading extends UserState {}

final class LogOutFailure extends UserState {
  final String errmessage;

  LogOutFailure({required this.errmessage});
}

//Forget Password
final class ForgetPassSuccess extends UserState {
  final String message;

  ForgetPassSuccess({required this.message});
}

final class ForgetPassLoading extends UserState {}

final class ForgetPassFailure extends UserState {
  final String errMessage;

  ForgetPassFailure({required this.errMessage});
}

//Add Item
final class AddItemSuccess extends UserState {
  final AddItemModel message;

  AddItemSuccess({required this.message});
}

final class AddItemLoading extends UserState {}

final class AddItemFailure extends UserState {
  final String errMessage;
  AddItemFailure({required this.errMessage});
}

//Edit User
final class EditUserSuccess extends UserState {
  final EditUserModel message;

  EditUserSuccess({required this.message});
}

final class EditUserLoading extends UserState {}

final class EditUserFailure extends UserState {
  final String errMessage;

  EditUserFailure({required this.errMessage});
}

//update product
final class UpdateSuccess extends UserState {
  final UpdateItemModel message;

  UpdateSuccess({required this.message});
}

final class UpdateLoading extends UserState {}

final class UpdateFailure extends UserState {
  final String errMessage;

  UpdateFailure({required this.errMessage});
}

//showone product
final class ShowOneSuccess extends UserState {
  final ShowOneModel product;

  ShowOneSuccess({required this.product});
}

final class ShowOneLoading extends UserState {}

final class ShowOneFailure extends UserState {
  final String errMessage;

  ShowOneFailure({required this.errMessage});
}

//allData
final class AllProductsSuccess extends UserState {
  final AllProductsModel products;

  AllProductsSuccess({required this.products});
}

final class AllProductsLoading extends UserState {}

final class AllProductsFailure extends UserState {
  final String errMessage;

  AllProductsFailure({required this.errMessage});
}

//exData
final class ExpiredSuccess extends UserState {
  final ExpiredProductModel exproducts;

  ExpiredSuccess({required this.exproducts});
}

final class ExpiredLoading extends UserState {}

final class ExpiredFailure extends UserState {
  final String errMessage;

  ExpiredFailure({required this.errMessage});
}

//soon to expire data
final class SoonExpiredSuccess extends UserState {
  final SoonExpiredProModel soonexproducts;

  SoonExpiredSuccess({required this.soonexproducts});
}

final class SoonExpiredLoading extends UserState {}

final class SoonExpiredFailure extends UserState {
  final String errMessage;

  SoonExpiredFailure({required this.errMessage});
}

//delete product
final class DeleteSuccess extends UserState {}

final class DeleteLoading extends UserState {}

final class DeleteFailure extends UserState {
  final String errMessage;

  DeleteFailure({required this.errMessage});
}

//check code
final class CheckCodeSuccess extends UserState {}

final class CheckCodeLoading extends UserState {}

final class CheckCodeFailure extends UserState {
  final String errMessage;

  CheckCodeFailure({required this.errMessage});
}

//reset Password
final class ResetPasswordSuccess extends UserState {
  final String message;

  ResetPasswordSuccess({required this.message});
}

final class ResetPasswordLoading extends UserState {}

final class ResetPasswordFailure extends UserState {
  final String errMessage;
  ResetPasswordFailure({required this.errMessage});
}
