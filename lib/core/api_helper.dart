import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIservice {
  Future<List<UserModel>> apiget() async {
    try {
     final Response response = await Dio().get(
        "https://jsonplaceholder.typicode.com/users",
      );
      print(response.data);
      return UserModel.convertAPiListtousermodellist(response.data);
    } on DioException catch (e) {
      print(e.message);
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

class UserModel {
  String name;
  String username;
  String email;
  String city;

  UserModel({
    required this.name,
    required this.email,
    required this.username,
    required this.city,
  });

  factory UserModel.fromapi(Map<String, dynamic> usermap) {
    return UserModel(
      name: usermap["name"],
      email: usermap["email"],
      username: usermap["username"],
      city: usermap["address"]["city"],
    );
  }
  static List<UserModel> convertAPiListtousermodellist(
    List<Map<String, dynamic>> aPiList,
  ) {
    return aPiList.map((e) {
      return UserModel.fromapi(e);
    }).toList();
  }
}

class Apiscreen extends StatefulWidget {
  const Apiscreen({super.key});
  @override
  State<Apiscreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<Apiscreen> {
  var list;
  @override
  void initState() {
    list = APIservice().apiget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].email),
                  trailing: Text(snapshot.data![index].city),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
