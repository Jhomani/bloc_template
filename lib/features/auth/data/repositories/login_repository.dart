import 'package:template/core/network/requests.dart';
import 'package:template/features/auth/data/models/login_.dart';
import 'package:template/features/auth/data/models/token.dart';


class AuthReporitory {
  Future<TokenModel?> loginUser(LoginModel datas) async {
    var http = ClientRequest(creator: TokenModel.jsonfy, endpoint: '/login');

    var token = await http.post<TokenModel>(datas.toObject()); 

    return token;
  }
}