import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../server/Data/Auth.dart';
import 'homeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hiden = true;
  bool remember = false;

  List<FocusNode> focusNodes = List.generate(3, (index) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController());
  // String email;
  // String password;
  final _formKey = GlobalKey<FormState>();

  void signIN() async {
    User user;
    try {
      user = await Auth().signUp(
          email: controllers[1].text.trim(),
          password: controllers[2].text,
          name: controllers[0].text.trim());
          Get.to(() => HomePage(), transition: Transition.fadeIn);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      SnackBar(
        content: Text("$e"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.fromLTRB(width / 3, height * 0.15, width / 3, 0),
            width: width * 0.3,
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.015),
              child: Image.asset('assets/img/we.png'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Create Account',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                  color: Color.fromARGB(255, 36, 96, 180),
                  fontWeight: FontWeight.w800,
                  fontSize: height * 0.035),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Let\'s make you official',
              textAlign: TextAlign.center,
              style: GoogleFonts.libreFranklin(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: SizedBox(
                  height: height * 7,
                  width: width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 10),
                            child: Text(
                              'Full name',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.libreFranklin(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width / 10,
                              right: width / 10,
                            ),
                            child: SizedBox(
                              height: height * 0.06,
                              width: width,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter valid email';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    fillColor:
                                        Color.fromARGB(132, 214, 212, 212),
                                    filled: true,
                                    focusColor: Colors.black),
                                focusNode: focusNodes[0],
                                controller: controllers[0],
                                autofocus: false,
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(focusNodes[0]),
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context)
                                        .requestFocus(focusNodes[1]),
                                // onSaved: (v) {
                                //   FocusScope.of(context)
                                //       .requestFocus(focusNodes[1]);
                                // },
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Manrope',
                                    fontSize: 18.5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width / 10),
                            child: Text(
                              'Username',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.libreFranklin(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width / 10,
                              right: width / 10,
                            ),
                            child: SizedBox(
                              height: height * 0.06,
                              width: width,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter valid email';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    fillColor:
                                        Color.fromARGB(132, 214, 212, 212),
                                    filled: true,
                                    focusColor: Colors.black),
                                focusNode: focusNodes[1],
                                controller: controllers[1],
                                autofocus: false,
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(focusNodes[1]),
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context)
                                        .requestFocus(focusNodes[2]),
                                // onSaved: (v) {
                                //   FocusScope.of(context)
                                //       .requestFocus(focusNodes[1]);
                                // },
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Manrope',
                                    fontSize: 18.5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12, left: width / 10),
                            child: Text(
                              'Password',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.libreFranklin(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width / 10,
                              right: width / 10,
                            ),
                            child: SizedBox(
                              height: height * 0.06,
                              width: width,
                              child: TextFormField(
                                obscureText: hiden,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter valid email';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: hiden
                                          ? const Icon(
                                              Icons.visibility_off,
                                            )
                                          : const Icon(
                                              Icons.visibility,
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          hiden = !hiden;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    fillColor:
                                        Color.fromARGB(132, 214, 212, 212),
                                    filled: true,
                                    focusColor: Colors.black),
                                focusNode: focusNodes[2],
                                controller: controllers[2],
                                autofocus: false,
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(focusNodes[2]),
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context).unfocus(),
                                // onSaved: (v) {
                                //   FocusScope.of(context)
                                //       .requestFocus(focusNodes[1]);
                                // },
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Manrope',
                                    fontSize: 18.5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 30),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  remember
                                      ? const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.check_circle,
                                        ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Remember Me',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.libreFranklin(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.07,
                                right: width / 18,
                                top: height * 0.03),
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.86,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 36, 96, 180),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: TextButton(
                                onPressed: () {
                                  signIN();
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.resolveWith<
                                      EdgeInsets>((Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return EdgeInsets.all(width / 30);
                                    }
                                    return EdgeInsets
                                        .zero; // Use the component's default.
                                  }),
                                  shape: MaterialStateProperty.resolveWith<
                                          OutlinedBorder>(
                                      (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15));
                                    }
                                    return const RoundedRectangleBorder(); // Use the component's default.
                                  }),
                                ),
                                child: Text(
                                  'Continue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Manrope',
                                      fontSize: height / 45),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.11,
                          ),
                          Container(
                            width: width * 0.9,
                            padding:
                                EdgeInsets.only(top: 20, left: width * 0.15),
                            alignment: Alignment.center,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text:
                                    'By creating an account or singning you agree to our',
                                style: GoogleFonts.libreFranklin(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const WidgetSpan(
                                  child: SizedBox(
                                width: 5,
                              )),
                              TextSpan(
                                text: 'Terms and Condition',
                                style: GoogleFonts.libreFranklin(
                                    color: Color.fromARGB(255, 36, 96, 180),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ])),
                          )
                        ]),
                  ))),
        ]),
      ),
    );
  }
}
