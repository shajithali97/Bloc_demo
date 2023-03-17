import 'package:bloc_login_demo/core/utils/app_utils.dart';
import 'package:bloc_login_demo/core/utils/size_config.dart';
import 'package:bloc_login_demo/features/auth/presentation/screen/home_screen.dart';
import 'package:bloc_login_demo/features/auth/presentation/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../bloc/login/login_bloc.dart';
import '../widget/custom_text_field.dart';
import '../widget/loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailEditingController;
  late TextEditingController passEditingController;
  @override
  void initState() {
    emailEditingController = TextEditingController();
    passEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hint: "Email address",
                editingController: emailEditingController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Password",
                editingController: passEditingController,
                obscrueText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: getProportionateScreenWidth(150),
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      AppUtils.showSnackBar(context, state.message);
                    } else if (state is LoginLoaded) {
                      AppUtils.showSnackBar(context, "Login successful",
                          backgroundColor: Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return LoadingButtonWidget(
                      backgroundColor: AppColor.secondaryColor,
                      isLoading: state is LoginLoading ? true : false,
                      buttonLabel: "Login",
                      onPressed: () => BlocProvider.of<LoginBloc>(context).add(
                        LoginApiEvent(
                          emailEditingController.text.toString(),
                          passEditingController.text.toString(),
                        ),
                      ),
                      height: getProportionateScreenHeight(60),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: getProportionateScreenWidth(150),
                child: LoadingButtonWidget(
                  backgroundColor: Colors.transparent,
                  isLoading: false,
                  buttonLabel: "Register",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  height: getProportionateScreenHeight(60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
