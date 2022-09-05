import 'package:template/core/constants/endpoints.dart';

import '../models/credentials_model.dart';
import '../models/token_model.dart';

import 'package:template/core/network/http.dart';

import 'dart:developer' as devtools;

class UserRemoteDataSource {
  late ClientRequest http;

  UserRemoteDataSource () {
    http = ClientRequest(
      creator: TokenModel.fromJSON,
      endpoint: Endpoint.login
    );
  }

  Future<TokenModel> login(CredentialModel credential) async{
    devtools.log("into Remote Repo");
    
    var response = await http.post<TokenModel>(
      credential.toObject()
    );

    devtools.log(response.toString());

    return response;
  }
}