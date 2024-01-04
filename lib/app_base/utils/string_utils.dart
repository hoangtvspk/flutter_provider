part of 'app_utils.dart';

abstract class StringUtils {
  static final Random _random = Random();

  // ignore: constant_identifier_names
  static const _CHARS =
      "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";

  static const formatPhoneNumber = '999-9999-9999';
  static const formatBusinessNumber = '999-99-99999';
  static const formatBankNumber = '999999-99-999999';
  static String getRandomString(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _CHARS.codeUnitAt(
          _random.nextInt(_CHARS.length),
        ),
      ),
    );
  }
}
