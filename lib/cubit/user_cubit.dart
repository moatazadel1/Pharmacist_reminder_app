import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:image_picker/image_picker.dart';

import 'package:reminder_app/cache/cache_helper.dart';
import 'package:reminder_app/core/api/api_consumer.dart';
import 'package:reminder_app/core/api/end_points.dart';
import 'package:reminder_app/core/errors/exceptions.dart';
import 'package:reminder_app/core/functions/upload_image_to_api.dart';
import 'package:reminder_app/core/models/notification_model.dart';
import 'package:reminder_app/core/utils/notification/local_notification_service.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/models/add_model.dart';
import 'package:reminder_app/models/all_products_model.dart';
import 'package:reminder_app/models/delete_product_model.dart';

import 'package:reminder_app/models/edit_user_model.dart';
import 'package:reminder_app/models/expired_model.dart';
import 'package:reminder_app/models/forget_model.dart';

import 'package:reminder_app/models/reset_pass_model.dart';
import 'package:reminder_app/models/showone_model.dart';
import 'package:reminder_app/models/sign_in_model.dart';
import 'package:reminder_app/models/sign_up_model.dart';
import 'package:reminder_app/models/soonexpired.dart';
import 'package:reminder_app/models/update_item_model.dart';
import 'package:reminder_app/models/user_model.dart';
import 'package:reminder_app/service/service_Locator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Profile Pic
  XFile? profilePic;
  //product Pic
  XFile? productPic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //forget password
  TextEditingController forgetPassword = TextEditingController();
  //checck code
  TextEditingController check_Code = TextEditingController();
  //reset password
  TextEditingController reset_Password = TextEditingController();
  //reset password confirm
  TextEditingController reset_confirm = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController updateName = TextEditingController();
  TextEditingController updateEmail = TextEditingController();
  TextEditingController UpdatePass = TextEditingController();
  TextEditingController UpdateConfirm_pass = TextEditingController();

  TextEditingController productName = TextEditingController();
  TextEditingController proDate = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController startReminder = TextEditingController();
  TextEditingController BatchNumber = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController quantity = TextEditingController();

  TextEditingController updateTitle = TextEditingController();
  TextEditingController updateProDate = TextEditingController();
  TextEditingController updateExpDate = TextEditingController();
  TextEditingController updateStartReminder = TextEditingController();
  TextEditingController updateCode = TextEditingController();
  TextEditingController updateDescription = TextEditingController();
  TextEditingController updateCategory = TextEditingController();
  TextEditingController updateQuantity = TextEditingController();

  SignInModel? user; //هناخد متغير من الموديل اللي عملناه علشان نستقبل الريسبوند
  AddItemModel? product;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  uploadProductPic(XFile image) {
    productPic = image;
    emit(UploadProductPic());
  }

  // Method to reset the product picture
  void resetProductPic() {
    productPic = null;
    emit(UserImageReset());
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoints.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      user =
          SignInModel.fromJson(response); //جواه الماسيدج والتوكين اللي راجعين
      getIt<CacheHelper>().saveData(key: ApiKey.token, value: user!.token);
      //final decodedToken = JwtDecoder.decode(user!.token);
//print(decodedToken['id']);
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errmessage: e.errModel.errorMessage));
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoints.signUp,
        isFormData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirm_password: confirmPassword.text,
          ApiKey.image: await uploadImageToAPI(profilePic!)
        },
      );
      final signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signUpModel.status));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }

  Future<void> getUserProfile() async {
    try {
      emit(GetUserLoading());
      final response = await api.get(
        EndPoints.Profile,
      );
      emit(GetUserSuccess(user: UserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetUserFailure(errMessage: e.errModel.errorMessage));
    }
  }

  logOut() async {
    try {
      emit(LogOutLoading());
      final response = await api.post(
        EndPoints.LogOut,
      );
      emit(LogOutSuccess());
    } on ServerException catch (e) {
      emit(LogOutFailure(errmessage: e.errModel.errorMessage));
    }
  }

  forgetPass() async {
    try {
      emit(ForgetPassLoading());
      final response = await api.post(
        EndPoints.forgetpassword,
        data: {
          ApiKey.email: forgetPassword.text,
        },
      );
      final forgetModel = ForgetModel.fromJson(response);
      final successMessage = forgetModel.status
          ? 'Password reset successful'
          : 'Password reset failed';
      emit(ForgetPassSuccess(message: successMessage));
    } on ServerException catch (e) {
      emit(ForgetPassFailure(errMessage: e.errModel.errorMessage));
    }
  }

  checkCode() async {
    try {
      emit(CheckCodeLoading());
      final response = await api.post(
        EndPoints.checkCode,
        data: {
          ApiKey.code: check_Code.text,
        },
      );

      emit(CheckCodeSuccess());
    } on ServerException catch (e) {
      emit(CheckCodeFailure(errMessage: e.errModel.errorMessage));
    }
  }

  resetPass() async {
    try {
      emit(ResetPasswordLoading());
      final response = await api.post(
        EndPoints.resetPassword,
        isFormData: true,
        data: {
          ApiKey.password: reset_Password.text,
          //ApiKey.confirm_password: reset_confirm.text,
        },
      );
      final resetModel = ResetPassModel.fromJson(response);
      emit(ResetPasswordSuccess(message: resetModel.message));
    } on ServerException catch (e) {
      emit(ResetPasswordFailure(errMessage: e.errModel.errorMessage));
    }
  }

  updateProfile() async {
    try {
      emit(EditUserLoading());
      final response = await api.post(
        EndPoints.updateProfile,
        isFormData: true,
        data: {
          ApiKey.name: updateName.text,
          ApiKey.email: updateEmail.text,
          ApiKey.password: UpdatePass.text,
          ApiKey.confirm_password: UpdateConfirm_pass.text,
          ApiKey.image: await uploadImageToAPI(profilePic!)
        },
      );
      emit(EditUserSuccess(message: EditUserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(EditUserFailure(errMessage: e.errModel.errorMessage));
    }
  }

  addItem() async {
    try {
      emit(AddItemLoading());
      // Convert the XFile to a MultipartFile
      var imageFile = await uploadImageToAPI(productPic!);
      // Create a FormData object for sending multipart/form-data
      var formData = FormData.fromMap({
        ApiKey.title: productName.text,
        ApiKey.pro_date: proDate.text,
        ApiKey.exp_date: expDate.text,
        ApiKey.start_reminder: startReminder.text,
        ApiKey.code: BatchNumber.text,
        ApiKey.description: description.text,
        ApiKey.type: category.text,
        ApiKey.quantity: quantity.text,
        ApiKey.item_image:
            imageFile, // Use the converted MultipartFile directly
      });
      final response = await api.post(
        EndPoints.addItem,
        data: formData,
      );
      product = AddItemModel.fromJson(response);
      await getIt<CacheHelper>().saveData(key: ApiKey.id, value: product!.id);
      emit(AddItemSuccess(message: AddItemModel.fromJson(response)));

      // Schedule a notification
      scheduleNotificationForProduct(
        id: product!.id,
        productName: productName.text,
        startReminder: startReminder.text,
        expDate: expDate.text,
      );
    } on ServerException catch (e) {
      emit(AddItemFailure(errMessage: e.errModel.errorMessage));
    }
  }

  Future<void> allData() async {
    try {
      emit(AllProductsLoading());
      final response = await api.get(
        EndPoints.alldata,
      );
      emit(AllProductsSuccess(products: AllProductsModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(AllProductsFailure(errMessage: e.errModel.errorMessage));
    }
  }

  expiredData() async {
    try {
      emit(ExpiredLoading());
      final response = await api.get(
        EndPoints.expire,
      );
      emit(ExpiredSuccess(exproducts: ExpiredProductModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(ExpiredFailure(errMessage: e.errModel.errorMessage));
    }
  }

  soonExpiredData() async {
    try {
      emit(SoonExpiredLoading());
      final response = await api.get(
        EndPoints.soonexpire,
      );
      emit(SoonExpiredSuccess(
          soonexproducts: SoonExpiredProModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(SoonExpiredFailure(errMessage: e.errModel.errorMessage));
    }
  }

  showOne() async {
    try {
      emit(ShowOneLoading());
      final id = await getIt<CacheHelper>().getData(key: ApiKey.id);
      final response = await api.get(
        EndPoints.showone(id),
      );
      emit(ShowOneSuccess(product: ShowOneModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(ShowOneFailure(errMessage: e.errModel.errorMessage));
    }
  }

  // updateItem() async {
  //   try {
  //     emit(UpdateLoading());
  //     var imageFile = await uploadImageToAPI(productPic!);
  //     var formData = FormData.fromMap({
  //       ApiKey.title: updateTitle.text,
  //       ApiKey.pro_date: updateProDate.text,
  //       ApiKey.exp_date: updateExpDate.text,
  //       ApiKey.start_reminder: updateStartReminder.text,
  //       ApiKey.code: updateCode.text,
  //       ApiKey.description: updateDescription.text,
  //       ApiKey.type: updateCategory.text,
  //       ApiKey.quantity: updateQuantity.text,
  //       ApiKey.item_image: imageFile,
  //     });
  //     final id = getIt<CacheHelper>().getData(key: ApiKey.id);

  //     final response = await api.post(
  //       EndPoints.updatedata(id),
  //       data: formData,
  //     );

  //     // Update the notification
  //     updateNotificationForProduct(
  //       id: id.toString(),
  //       productName: updateTitle.text,
  //       startReminder: updateStartReminder.text,
  //       expDate: updateExpDate.text,
  //     );

  //     emit(UpdateSuccess(message: UpdateItemModel.fromJson(response)));
  //   } on ServerException catch (e) {
  //     emit(UpdateFailure(errMessage: e.errModel.errorMessage));
  //   }
  // }
  Future<void> updateItem(int id) async {
    try {
      emit(UpdateLoading());
      var imageFile = await uploadImageToAPI(productPic!);
      var formData = FormData.fromMap({
        ApiKey.title: updateTitle.text,
        ApiKey.pro_date: updateProDate.text,
        ApiKey.exp_date: updateExpDate.text,
        ApiKey.start_reminder: updateStartReminder.text,
        ApiKey.code: updateCode.text,
        ApiKey.description: updateDescription.text,
        ApiKey.type: updateCategory.text,
        ApiKey.quantity: updateQuantity.text,
        ApiKey.item_image: imageFile,
      });

      final response = await api.post(
        EndPoints.updatedata(id),
        data: formData,
      );

      // Update the notification
      updateNotificationForProduct(
        id: id.toString(),
        productName: updateTitle.text,
        startReminder: updateStartReminder.text,
        expDate: updateExpDate.text,
      );

      emit(UpdateSuccess(message: UpdateItemModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(UpdateFailure(errMessage: e.errModel.errorMessage));
    }
  }

  void updateNotificationForProduct({
    required String id,
    required String productName,
    required String startReminder,
    required String expDate,
  }) async {
    // Cancel the old notification
    await LocalNotificationService.cancelNotification(int.parse(id));

    // Schedule the new notification
    scheduleNotificationForProduct(
      id: int.parse(id),
      productName: productName,
      startReminder: startReminder,
      expDate: expDate,
    );

    // Update notification data
    NotificationModel updatedNotification = NotificationModel(
      id: int.parse(id),
      title: 'Product Expiry Reminder',
      body:
          'The product "$productName" will soon be about to expire on $expDate.',
      scheduledDate: DateFormat('yyyy-MM-dd')
          .format(DateFormat('yyyy-MM-dd').parse(startReminder)),
    );
    await saveNotificationData(updatedNotification);
  }

  Future<void> delete(int id) async {
    try {
      emit(DeleteLoading());

      await api.delete(EndPoints.delete(id));

      // Cancel the scheduled notification
      await LocalNotificationService.cancelNotification(id);

      // Remove the notification data
      await removeNotificationById(id);

      // Notify the NotificationsScreen about the deletion
      NotificationStream.instance.notify();

      emit(DeleteSuccess());
    } on ServerException catch (e) {
      emit(DeleteFailure(errMessage: e.errModel.errorMessage));
    } catch (e) {
      emit(DeleteFailure(errMessage: 'An unknown error occurred'));
    }
  }

  void scheduleNotificationForProduct({
    required int id,
    required String productName,
    required String startReminder,
    required String expDate,
  }) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'scheduled_notification',
      'id_0',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );

    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    DateTime startReminderDate = DateFormat('yyyy-MM-dd').parse(startReminder);
    tz.TZDateTime scheduledDate = tz.TZDateTime.from(
            startReminderDate, tz.local)
        .add(const Duration(hours: 9)); // Schedule at 9 AM on the reminder date

    await LocalNotificationService.flutterLocalNotificationsPlugin
        .zonedSchedule(
      id, // Use the id here
      'Product Expiry Reminder',
      'The product "$productName" will soon be about to expire on $expDate.',
      scheduledDate,
      details,
      payload: 'zonedSchedule',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
    log(scheduledDate.toString());

    // Save notification data
    NotificationModel notification = NotificationModel(
      id: id, // Use the id here
      title: 'Product Expiry Reminder',
      body:
          'The product "$productName" will soon be about to expire on $expDate.',
      scheduledDate: DateFormat('yyyy-MM-dd').format(startReminderDate),
    );
    await saveNotificationData(notification);
  }

  Future<void> saveNotificationData(NotificationModel notification) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notifications = prefs.getStringList('notifications') ?? [];

    // Remove old notification with the same ID if exists
    notifications.removeWhere((notificationString) {
      final existingNotification =
          NotificationModel.fromMap(json.decode(notificationString));
      return existingNotification.id == notification.id;
    });

    notifications.add(json.encode(notification.toMap()));
    await prefs.setStringList('notifications', notifications);
  }

  Future<void> removeNotificationById(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notificationStrings =
        prefs.getStringList('notifications') ?? [];

    notificationStrings.removeWhere((notificationString) {
      final notification =
          NotificationModel.fromMap(json.decode(notificationString));
      return notification.id ==
          productId; // Directly compare with int productId
    });

    await prefs.setStringList('notifications', notificationStrings);
  }
}

class NotificationStream {
  static final NotificationStream _instance = NotificationStream._internal();
  final StreamController<void> _controller = StreamController.broadcast();

  factory NotificationStream() {
    return _instance;
  }

  NotificationStream._internal();

  Stream<void> get stream => _controller.stream;

  void notify() {
    _controller.add(null);
  }

  void dispose() {
    _controller.close();
  }

  static NotificationStream get instance => _instance;
}
