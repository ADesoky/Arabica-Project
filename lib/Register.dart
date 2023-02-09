import 'dart:convert';
import 'package:arabicaa/config.dart';
import 'package:arabicaa/medels/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 2: Payment',
      style: optionStyle,
    ),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isPassword = true;
  Icon icon = const Icon(Icons.visibility);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title Screen',
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF8EA),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFF8EA),
          elevation: 0.0,

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  Image.asset(
                      'asset/images/tea-cup.gif', height: 300, width: 300),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.abc),
                        label: Text('First Name'),
                        // hintText: 'Add your name ',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: lastNameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.abc),
                        label: Text('Last Name'),
                        // hintText: 'Add your name ',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.abc),
                        label: Text('User Name'),
                        // hintText: 'Add your name ',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.email),
                        label: Text('Email'),
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: passController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    obscureText: isPassword,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(

                        ),
                        suffixIcon: IconButton(
                          icon: icon,
                          onPressed: () {
                            isPassword = !isPassword;
                            if (isPassword) {
                              icon = const Icon(Icons.visibility);
                            } else {
                              icon = const Icon(Icons.visibility_off);
                            }
                            setState(() {});
                          },
                        ),
                        prefix: const Icon(Icons.lock),
                        label: const Text('Passward'),
                        labelStyle: const TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: phoneController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(

                        ),
                        prefix: const Icon(Icons.phone),
                        label: const Text('Phone'),
                        labelStyle: const TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: addressController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.home),
                        label: Text('Address'),
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF734F35)),
                        onPressed: () {
                          registerNewUser(
                              firstNameController.text,
                              lastNameController.text,
                              userNameController.text,
                              emailController.text,
                              phoneController.text,
                              addressController.text,
                              passController.text);
                        },
                        child: const Text(
                          'Lets Go', style: TextStyle(color: Colors.white),)),
                  ),


                ],
              ),
            ),
          ),
        ),

      ),
    );
  }

  User? userModelObject;

  Future registerNewUser(String fname, String lname, String uname, String email,
      String phone, String address, String pass) async {
    var url = Uri.parse(
        "${APIConfig.BASE_URL}userRegister.php?first_name=$fname&"
            "last_name=$lname&user_name=$uname&user_email=$email&user_password=$pass&user_phone=$phone&address=$address");
    print(url);
    var response = await http.get(url);
    userModelObject = User.fromJson(jsonDecode(response.body));
    if (userModelObject!.message == "User Registered Successfully") {
      /// NAvigate to home
      print("navigate to home");
      globalUserModel = userModelObject;

      print(userModelObject!.message);
      Navigator.pushNamed(context, '/home');
    } else {
      // Toast
      var snackBar = SnackBar(
        content: Text(userModelObject!.message!),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    

  }
  Future loginUser(email, pass) async {
    var response = await Dio().post('https://api.storerestapi.com/auth/login', data: {
      'email': email,
      'password': pass,
    });
    print(response.data['message']);
  }
  Future register(email, pass) async {
    var response = await Dio().post('https://api.storerestapi.com/auth/register', data: {
      'name': 'Ahmed',
      'email': email,
      'number': 5632,
      'password': pass,
      'password_repeat': pass,
    });
    print(response.data['message']);
  }
}
