import 'Networking.dart';

class AuthService{

  Future<dynamic> login(String mobileNumber) async {
    NetworkHelper networkHelper = NetworkHelper(url: '/v1/user/auth');

    dynamic decodedBody = await networkHelper.postData({"mobileNumber": mobileNumber, "isCustomer": true});
    print(decodedBody);
    return decodedBody;
  }

  Future<dynamic> verifyOtp(String mobileNumber, String otp) async {
    NetworkHelper networkHelper = NetworkHelper(url: '/v1/user/validate');

    dynamic decodedBody = await networkHelper.postData({"mobileNumber": mobileNumber, "otp": otp});
    print(decodedBody);
    return decodedBody;
  }

}
