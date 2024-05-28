class EndPoints {
  static String baseUrl = "http://mohamedsadek.c1.is/api/";
  static String signIn = "user/Login";
  static String signUp = "user/Register";
  // static String getUserDataEndPoint(id){
  //   return "user/Profile/$id";
  // }
  static String Profile = "profile/ProfileUser";
  static String LogOut = "user/Logout";
  static String forgetpassword = "emailExists";
  static String checkCode = "checkCode";
  static String resetPassword = "resetPassword";
  static String resendCode = "sendCode";
  static String addItem = "item/create";
  static String updateProfile = "profile/updateprofile";
  static String alldata = "item/alldata";
  static String allcategory = "item/allcategory";
  static String expire = "item/expire";
  static String soonexpire = "item/soonexpire";
  // static String updatedata(id) {
  //   return "updatedata/$id";
  // }

  static String updatedata(int id) {
    return "item/updatedata/$id";
  }

  static String showone(id) {
    return "item/showone/$id";
  }

  static String delete(int id) {
    return "item/delete/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String error = "error";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String success = "success";
  static String id = "id";
  static String name = "name";
  static String image = "image";
  static String confirm_password = "confirm_password";

  static String title = "title";
  static String item_image = "item_image";
  static String pro_date = "pro_date";
  static String start_reminder = "start_reminder";
  static String exp_date = "exp_date";
  static String description = "description";
  static String category_id = "category_id";
  static String type = "type";
  static String code = "code";
  static String quantity = "quantity";
}
