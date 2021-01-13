import 'package:flutter_crud_api_sample_app/src/model/profile.dart';
//import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl = "https://pattanaapps.herokuapp.com";
 // Client client = Client();

  Future<List<Profile>> getProfiles() async {

    final response = await http.get("$baseUrl/api/profile");
    int statusCode=response.statusCode;
    print('getProfiles() status Code:= $statusCode');

    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProfile(Profile data) async {
    print('createProfile $baseUrl/api/profile');
    print('createProfile data='+data.toString());
    print('createProfile profileToJson data='+profileToJson(data));
    final response = await http.post(
      "$baseUrl/api/profile",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    int statusCode=response.statusCode;
    print('createProfile() status Code:= $statusCode');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile data) async {
    print('updateProfile $baseUrl/api/profile');
    print('updateProfile data='+data.toString());
    print('updateProfile profileToJson data='+profileToJson(data));

    final response = await http.put(
      "$baseUrl/api/profile/${data.id}",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    int statusCode=response.statusCode;
    print('updateProfile() status Code:= $statusCode');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(String id) async {
    print('deleteProfile() url:=$baseUrl/api/profile/$id');
    final response = await http.delete(
      "$baseUrl/api/profile/$id",
      headers: {"content-type": "application/json"},
    );
    int statusCode=response.statusCode;
    print('deleteProfile() status Code:= $statusCode');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
