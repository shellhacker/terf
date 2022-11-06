import 'package:dio/dio.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/model/mobile_verification_model.dart';
import 'package:terf/widgets/const.dart';

class MobileVerificationServices {
  MobileVerificationServices._instans();
  static MobileVerificationServices instans =
      MobileVerificationServices._instans();
  factory MobileVerificationServices() {
    return instans;
  }

  Future<MobileVerificationModel?> mobileNumberVerfyimg(
      MobileVerificationModel value) async {
    print('hai1111111111111111111111111');
    try {
      Response response =
          await Dio().post(baseUrl + loginMobileOtp, data: value.tojson());

      if (response.statusCode == 200) {
        // var datas = await json.decode(response.data);
        return MobileVerificationModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print('server error');
      }
    } catch (e) {
      print("mobile otp errroooooorrrreeeeeeeeeeee $e");
    }
  }
}
