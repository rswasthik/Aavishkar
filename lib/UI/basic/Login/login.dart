import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathoncode/constants/style.dart';
import 'package:hackathoncode/ui/basic/Login/signgoogle.dart';
import 'package:hackathoncode/ui/basic/SignUp/signuppage.dart';

import '../../../constants/Images_strings.dart';
import '../forgotpassword/FPBottomsheet.dart';
import '../home/HomePage/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordlcontroller = TextEditingController();
  bool _obscureText = true;
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('No User Found');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.roboto(fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        shadowColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(farmertractor),
                  height: size.height * 0.27,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: 'Email ID',
                            labelStyle: ktextstyle,
                            border: OutlineInputBorder(),
                            hintText: 'Email ID'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        controller: _passwordlcontroller,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: 'Password',
                            labelStyle: ktextstyle,
                            // suffixIcon: IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(Icons.remove_red_eye_outlined),
                            // ),
                            suffixIcon: _obscureText == true
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      size: 20,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                    )),
                            border: OutlineInputBorder(),
                            hintText: 'Password'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            'Forgot password',
                            style: GoogleFonts.roboto(),
                          ),
                          onPressed: () {
                            ForgotpasswwordScreen.bottomsheet(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(
                            'Login',
                            style: GoogleFonts.roboto(),
                          ),
                          onPressed: () async {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => HomePage()));
                            User? user = await loginUsingEmailPassword(
                                email: _emailcontroller.text.trim(),
                                password: _passwordlcontroller.text.trim(),
                                context: context);
                            print(user);

                            if (user != null) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            }
                          },
                        ),
                      ),
                    ),
                    signwithgoogle(),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => signuppage()));
                          },
                          child: Text.rich(
                            TextSpan(
                                text: 'Don,t have an account?  ',
                                style: GoogleFonts.roboto(
                                    color: Colors.black, fontSize: 15),
                                children: [
                                  TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 20))
                                ]),
                          )),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
