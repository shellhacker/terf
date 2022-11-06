import 'package:dio/dio.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/model/mobile_verification_model.dart';
import 'package:terf/widgets/const.dart';

class OtpVerificationServices {
  OtpVerificationServices._instans();
  static OtpVerificationServices instans = OtpVerificationServices._instans();
  factory OtpVerificationServices() {
    return instans;
  }

  Future<MobileVerificationResponseModel?> mobileOtpVerfyimg(
      MobileVerificationResponseModel value) async {
    try {
      Response response =
          await Dio().post(baseUrl + verifyMobileOtp, data: value.tojson());

      print('hxhhdjjkdvkjsv');
      print(value.otp);
      if (response.statusCode == 200) {
        // var datas = await json.decode(response.data);
        print(response.data);
        return MobileVerificationResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // return MobileVerificationResponseModel.fromJson(response.data);
      }
    } catch (e) {
      print("mobile otp errroooooorrrreeeeeeeeeeee $e");
    }
    return null;
  }
}
