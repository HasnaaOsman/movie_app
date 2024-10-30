import 'package:flutter/material.dart';
import 'package:movie/home/view/screen/home_screen.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? username;
  String? password;
  String? email;
  //late TextEditingController mycontroller;
  get mycontroller => null;

  bool isObsecureText = true;
  bool isObsecureText2 = true;

  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(children: [
      Container(
          padding: const EdgeInsets.all(10),
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formstate,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 90,
                ),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Your Username',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: mycontroller,
                  onSaved: (val) {
                    username = val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty field';
                    }
                    if (value.length > 14) {
                      return " Not valid , no more than 14 char";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 216, 133, 85),
                    ),
                    hintText: 'username',
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                    // label: const Text('Enter Username'),
                    // labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF000000),
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 216, 133, 85), width: 2),
                        borderRadius: BorderRadius.circular(40)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Color(0xFF000000), width: 2),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your E-mail',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: mycontroller,
                  onSaved: (val) {
                    email = val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty Field';
                    } else if (!(value.contains('@'))) {
                      return 'Enter valid Email , which contains @';
                    }
                    final regex = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 216, 133, 85),
                    ),
                    hintText: 'email',
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                    // label: const Text('Enter E-mail'),
                    // labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF000000),
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 216, 133, 85), width: 2),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your Password',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: mycontroller,
                  obscureText: isObsecureText,
                  onSaved: (val) {
                    password = val;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                      return 'Password must contain at least one lowercase letter';
                    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                      return 'Password must contain at least one number';
                    } else if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
                      return 'Password must contain at least one special character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObsecureText = !isObsecureText;
                        });
                      },
                      child: isObsecureText
                          ? const Icon(
                              Icons.visibility_off,
                              color: Color.fromARGB(255, 216, 133, 85),
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Color.fromARGB(255, 216, 133, 85),
                            ),
                    ),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Color.fromARGB(255, 216, 133, 85),
                    ),
                    hintText: 'password',
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                    // label: const Text('Enter password'),
                    // labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                    // fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF000000),
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 216, 133, 85), width: 2),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 216, 133, 85),
                      borderRadius: BorderRadius.circular(40)),
                  child: MaterialButton(
                    textColor: Colors.white,
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }
                    },
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text(
                          ' Sign Up',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ?',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const Login()));
                        },
                        child: const Text('Login',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ]))),
    ])));
  }
}
