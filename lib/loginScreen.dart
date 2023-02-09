import 'package:arabicaa/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'medels/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  bool isPassword = true;
  Icon icon = const Icon(Icons.visibility);
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8EA),
        elevation: 0.0,
        titleSpacing: 20.0,
      ),
      backgroundColor: const Color(0xFFFFF8EA),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                Container(child:
                Image.asset('asset/images/5a1d2596297a29 1.png' , height: 300,width: 300)),
                const SizedBox(
                  height: 15,
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
                      prefix: Icon(Icons.mail),
                      label: Text(' Email'),
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
                      label: const Text(' Passward'),
                      labelStyle: const TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: const <Widget>[
                    Expanded(
                        child: Divider(
                          height: 5.0,
                          color: Colors.black12,
                          endIndent:10 ,
                        )
                    ),

                    Text("Forget Password ?" ,style: TextStyle(fontWeight: FontWeight.bold),),

                  ], ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 60.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF734F35)),
                      onPressed: () {
                        loginUser(emailController.text, passController.text,context);

                      },
                      child: const Text('LOGIN',style: TextStyle(color: Colors.white),)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    children: const <Widget>[
                      Expanded(
                          child: Divider(
                            height: 10.0,
                            thickness: 2.0,
                            color: Colors.black,
                            endIndent:10 ,
                          )
                      ),

                      Text("OR" ,style: TextStyle(fontWeight: FontWeight.bold),),

                      Expanded(
                          child: Divider(

                            height: 10.0,
                            thickness: 2.0,
                            color: Colors.black,
                            indent:10,
                          )
                      ),
                    ]
                ),

                Container(
                  width: double.infinity,
                  height: 60.0,
                  child: OutlinedButton(

                      onPressed: () {
                        Navigator.pushNamed(context, '/Reg');
                      },
                      child: const Text('Create Account',style:
                      TextStyle(color: Colors.brown,fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.wallet),
      //       label: 'Payment',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
  User? userModel;
  Future loginUser(String email, String pass,context) async {
    var response = await Dio().get('${APIConfig.BASE_URL}userLogin.php', queryParameters: {
      'email': email,
      'password': pass,
    });

    userModel = User.fromJson(response.data);
    if (userModel!.message == 'User Logged in successfully') {
      globalUserModel = userModel ;
      Navigator.pushNamed(context, '/home');
    } else {
      var snackBar = SnackBar(
        content: Text(userModel!.message!),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}



