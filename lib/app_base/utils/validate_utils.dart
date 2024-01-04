part of 'app_utils.dart';

enum ValidateType { email, password, phone, rePassword, businessNumber, none }

abstract class ValidatorUtils {
  static const String errorEmpty = "Please fill this information";
  static const String errorEmail = "Email not correct";
  static const String errorPassword = "Password not correct";
  static const String errorRePassword = "Password not the same";
  static const String errorPhoneNumber = "Invalidate phone number";

  static String sourceEmailReg =
      r"^([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$";

  static validate(
    String? data, {
    required BuildContext context,
    ValidateType type = ValidateType.none,
    int? min,
    int? max,
    bool allowEmpty = false,
  }) {
    ///Empty
    if (!allowEmpty && data!.isEmpty) {
      return errorEmpty;
    }

    switch (type) {
      case ValidateType.email:

        ///Email pattern
        final RegExp emailRegex = RegExp(sourceEmailReg);
        if (!emailRegex.hasMatch(data!)) {
          return errorEmail;
        }
        return null;
      case ValidateType.password:
        if (!data!.isPassword) {
          return errorPassword;
        }
        return null;

      case ValidateType.businessNumber:
        if (!(data!.length == StringUtils.formatBusinessNumber.length)) {
          return errorPhoneNumber;
        }
        return null;
      default:
        return null;
    }
  }
}
