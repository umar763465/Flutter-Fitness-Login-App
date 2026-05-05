import 'package:flutter/material.dart';
import 'package:login_screen/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  var nameValue = '';
  var emailValue = '';
  var passwordValue = '';
  var passwordConfirmValue = '';

  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  @override
  void initState() {
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 115, 1, 1),
                  Color.fromARGB(255, 45, 15, 63),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
            child: Align(
              alignment: AlignmentGeometry.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Align(
              alignment: AlignmentGeometry.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 90, 0, 0),
            child: const Text(
              'Create New\nAccount!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Container(
              height: screenHeight * 0.65,
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
                bottom: 20,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formkey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          color: Color.fromARGB(255, 115, 1, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 0.5,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 16),
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller: nameController,

                        decoration: InputDecoration(
                          hintText: nameValue,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 115, 1, 1),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          color: Color.fromARGB(255, 115, 1, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 0.5,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 16),
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        controller: emailController,

                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: emailValue,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 115, 1, 1),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Color.fromARGB(255, 115, 1, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 0.5,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 16),
                        obscureText: _obscureText,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        controller: passwordController,

                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: passwordValue,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          isDense: true,

                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 20,
                            minWidth: 20,
                          ),

                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              // Toggle the visibility state
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                            ),
                          ),

                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 115, 1, 1),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Color.fromARGB(255, 115, 1, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 0.5,
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 16),
                        obscureText: _obscureTextConfirm,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.done,
                        controller: passwordConfirmController,

                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: passwordConfirmValue,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          isDense: true,

                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 20,
                            minWidth: 20,
                          ),

                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              // Toggle the visibility state
                              setState(() {
                                _obscureTextConfirm = !_obscureTextConfirm;
                              });
                            },
                            icon: Icon(
                              _obscureTextConfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                            ),
                          ),

                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),

                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 115, 1, 1),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 164, 4, 4),
                                  Color.fromARGB(255, 87, 29, 120),
                                ],
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                // Validate Form
                                if (_formkey.currentState!.validate()) {
                                  var name = nameController.text.trim();
                                  var email = emailController.text.trim();
                                  var password = passwordController.text.trim();
                                  var passwordConfirm = passwordConfirmController.text
                                      .trim();

                                  var prefssignup =
                                      await SharedPreferences.getInstance();

                                  prefssignup.setString("name", name);
                                  prefssignup.setString("email", email);
                                  prefssignup.setString("password", password);
                                  prefssignup.setString(
                                    "passwordConfirm",
                                    passwordConfirm,
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Login Successful!'),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Please fix errors first',
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 115, 1, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void getValue() async {

    var prefssignup = await SharedPreferences.getInstance();
    
    var getName = prefssignup.getString("name");
    var getEmail = prefssignup.getString("email");
    var getPassword = prefssignup.getString("password");
    var getPasswordConfirm = prefssignup.getString("passwordConfirm");

    nameValue = getName ?? 'John Smith';
    emailValue = getEmail ?? 'joydero@example.com';
    passwordValue = getPassword ?? '********';
    passwordConfirmValue = getPasswordConfirm ?? '********';

    setState(() {
      
    });
  }
}