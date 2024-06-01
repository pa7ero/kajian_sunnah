import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajian_sunnah/home/auth_page/bloc/login_bloc.dart';
import 'package:kajian_sunnah/home/auth_page/register.dart';
import 'package:kajian_sunnah/home/home_page/home.dart';
import 'package:kajian_sunnah/service/auth_service.dart';
import 'package:kajian_sunnah/service/topik_service.dart';
import 'package:kajian_sunnah/service/ustadz_service.dart';
// import 'package:kajian_sunnah/service/topik_service.dart';

class LoginError extends StatefulWidget {
  const LoginError({Key? key}) : super(key: key);

  @override
  _LoginErrorState createState() => _LoginErrorState();
}

class _LoginErrorState extends State<LoginError> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: AuthRepository(),
      ),
      child: loginView(),
    );
  }
}

class loginView extends StatelessWidget {
  loginView({
    super.key,
  });
  final bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => Home(
                        topikService: TopikService(),
                        ustadzService: UstadzService(),
                      )),
            );
          } else if (state is LoginFailure) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginError()),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: [
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
                          SizedBox(height: 45),
                          Container(
                            width: 370,
                            height: 237,
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
                          SizedBox(height: 40),
                          Container(
                            width: 340,
                            height: 40,
                            child: TextField(
                              controller: emailController,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: Colors.green, width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter your username or email',
                                // errorText: state is LoginFailure &&
                                //         state.error.contains('Email')
                                //     ? state.error
                                //     : null,
                              ),
                              showCursor: true,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 340,
                            height: 40,
                            child: TextField(
                              controller: passwordController,
                              textAlignVertical: TextAlignVertical.bottom,
                              obscureText: _obsecureText,
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: Colors.green, width: 2),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(_obsecureText
                                        ? Icons.remove_red_eye
                                        : Icons.visibility_off)),
                                filled: true,
                                fillColor: Colors.white,
                                // errorText: state is LoginFailure &&
                                //         state.error.contains('Password')
                                //     ? state.error
                                //     : null,
                                hintText: 'Enter your password',
                              ),
                              showCursor: true,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('email atau password salah!'),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fixedSize: Size(340, 40),
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                    LoginButtonPressed(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
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
                              Text('Don’t have an account?'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Register();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  '  Sign Up',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot password?',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (state is LoginFailure &&
                    !state.error.contains('Email') &&
                    !state.error.contains('Password'))
                  Text(state.error,
                      style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
            );
          },
        ),
      ),
    );
  }
}
