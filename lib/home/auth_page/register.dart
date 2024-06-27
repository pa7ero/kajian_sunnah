import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajian_sunnah/home/auth_page/bloc/register_bloc.dart';
import 'package:kajian_sunnah/home/auth_page/login.dart';
import 'package:kajian_sunnah/service/auth_service.dart';
import 'package:kajian_sunnah/widget/E_button.dart';
import 'package:kajian_sunnah/widget/mod_textfield.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(
        authRepository: AuthRepository(),
      ),
      child: RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController password_confirmationController =
        TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      key: _formkey,
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login()),
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Stack(children: [
              Container(
                width: 414,
                height: 896,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.centerLeft,
                    radius: 1.5,
                    focalRadius: 0.8,
                    colors: [
                      Colors.blueAccent,
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          width: 260,
                          height: 146,
                          child: Image.asset(
                            "assets/images/Group.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Kajian Sunnah Kini Mudah',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProzaLibre-Bold',
                            wordSpacing: 5,
                            height: 1.0,
                          ),
                        ),
                        SizedBox(height: 5),
                        ModTextField(
                            controller: nameController,
                            hintText: 'Enter your Name'),
                        SizedBox(height: 5),
                        ModTextField(
                            controller: emailController,
                            hintText: 'Enter your email'),

                        SizedBox(height: 5),
                        ModTextField(
                            controller: passwordController,
                            hintText: 'Enter your password'),

                        SizedBox(height: 5),
                        ModTextField(
                            controller: password_confirmationController,
                            hintText: 'Confirm your password'),

                        //       validator: (value) {
                        //         if (passwordController.text !=
                        //             password_confirmationController.text) {
                        //           return "Passwords tidak sama";
                        //         }
                        //         if (value == null || value.isEmpty) {
                        //           return "Password tidak boleh kosong";
                        //         }
                        //         String pattern =
                        //             r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        //         RegExp regExp = RegExp(pattern);
                        //         if (!regExp.hasMatch(value)) {
                        //           return "Password harus mengandung minimal 1 huruf kapital, 1 angka, dan 1 karakter spesial";
                        //         }
                        //         return null;
                        //       }),
                        // ),
                        SizedBox(height: 5),
                        ModTextField(
                            controller: phoneController,
                            hintText: 'Confirm your phone'),

                        SizedBox(height: 5),
                        ModTextField(
                            controller: genderController, hintText: 'Gender'),

                        SizedBox(height: 5),
                        ModTextField(
                            controller: addressController, hintText: 'Address'),
                        // Container(
                        //   width: 340,
                        //   height: 50,
                        //   child: TextField(
                        //     controller: addressController,
                        //     textAlignVertical: TextAlignVertical.top,
                        //   ),
                        // ),
                        SizedBox(height: 5),
                        Ebutton(
                          text: 'Register',
                          txtcolor: Colors.white,
                          btncolor: Colors.blue,
                          onpress: () {
                            if (_formkey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('kesalahan')),
                              );
                            }

                            context.read<RegisterBloc>().add(
                                  RegisterButtonPressed(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    password_confirmation:
                                        password_confirmationController.text,
                                    address: addressController.text,
                                    phone: phoneController.text,
                                    gender: genderController.text,
                                  ),
                                );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 215,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Login();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                '  Sign in',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
