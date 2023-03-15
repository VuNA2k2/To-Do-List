import 'base.dart';

class LanguageVi extends BaseLanguage {
  @override
  String get appName => 'Tên Ứng Dụng';

  @override
  String get loginScreenTitle => 'Đăng nhập \nvào \ntài khoản của bạn';

  @override
  String get hintTextEmail => 'Email';

  @override
  String get hintTextPassword => 'Mật khẩu';

  @override
  String get rememberMeLabel => 'Nhớ mật khẩu';

  @override
  String get loginLabel => 'Đăng nhập';

  @override
  String get signUpLabel => 'Đăng ký';

  @override
  String get noAccountQuote => 'Bạn chưa có tài khoản?';

  @override
  String get signUpScreenTitle => 'Đăng ký \ntài khoản \ncủa bạn';

  @override
  String get exitsAccountQuote => 'Bạn đã có tài khoản?';

  @override
  String get fillProfileLabel => 'Điền thông tin cá nhân';

  @override
  String get hintTextUserName => 'Nick name';

  @override
  // TODO: implement dateOfBirthLabel
  String get dateOfBirthLabel => throw UnimplementedError();

  @override
  // TODO: implement emailLabel
  String get emailLabel => throw UnimplementedError();

  @override
  // TODO: implement fullNameLabel
  String get fullNameLabel => throw UnimplementedError();

  @override
  // TODO: implement phoneNumberLabel
  String get phoneNumberLabel => throw UnimplementedError();

  @override
  // TODO: implement saveLabel
  String get saveLabel => 'Lưu';

  @override
  // TODO: implement skipLabel
  String get skipLabel => 'Bỏ qua';


}
