import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_project/Model/user_list_response.dart';
import 'package:riverpod_project/Screen/View/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  Future<void> loginPost(String email, String password, context) async {
    final response = await http.post(
        Uri.parse('http://54.242.246.152:3000/api/v1/user/login'),
        body: {"email": email, "password": password});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      //Data Stroge
      SharedPreferences perf = await SharedPreferences.getInstance();
      await perf.setString('login', data['userToken']);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
      print(data['userToken']);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("User Authentication"),
            content: const Text("Login Failed"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              )
            ],
          );
        },
      );
    }
  }

  Future<UserListResponse?> fatchData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('login');

    if (token != null) {
      final response = await http.get(
        Uri.parse('http://54.242.246.152:3000/api/v1/user'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if(response.statusCode == 200){
        /// quick type model
        // final userModel = userModelFromJson(response.body);
        // return userModel;
        
        final userModel = UserListResponse.fromJson(jsonDecode(response.body));
        return userModel;
       
      }
      else{
        print("Failed to FacthData: ${response.body}");
      }
    } else {
      print("No Token Found");
    }
    return null;
  }
}

final userData = Provider<ApiServices>((ref) => ApiServices());
