import 'package:check_list_app_1/login/util/validation_rules/verify_user.dart';
import 'package:check_list_app_1/values/custom_colors.dart';
import 'package:check_list_app_1/login/util/validation_rules/email_validation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with EmailValidationMixin {
  final _formKey = GlobalKey<FormState>();

  final _emailTEC = TextEditingController();

  Color topColor = CustomColors().getActivePrimaryColor();
  Color bottomColor = CustomColors().getActiveSecondaryColor();

  bool continueConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              topColor,
              bottomColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 30,
                ),
                child: Image.asset(
                  'lib/assets/icon_task(2).png',
                  height: 200,
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                ),
                child: Text(
                  "Entrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors().getActiveDetailsColor(),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // E-mail
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailTEC,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: CustomColors().getActiveDetailsColor()),
                        cursorColor: CustomColors().getActiveDetailsColor(),
                        cursorErrorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          labelText: "Insira o seu e-mail",
                          labelStyle: TextStyle(
                              color: CustomColors().getActiveDetailsColor()),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: CustomColors().getActiveDetailsColor(),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors().getActiveDetailsColor()),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors().getActiveDetailsColor()),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors().getActiveDetailsColor()),
                          ),
                        ),
                        validator: isNotEmpty,
                      )
                    ],
                  ),
                ),
              ),

              // Password
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      style: TextStyle(
                          color: CustomColors().getActiveDetailsColor()),
                      cursorColor: CustomColors().getActiveDetailsColor(),
                      cursorErrorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        labelText: "Insira a sua senha",
                        labelStyle: TextStyle(
                            color: CustomColors().getActiveDetailsColor()),
                        prefixIcon: Icon(
                          Icons.key,
                          color: CustomColors().getActiveDetailsColor(),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: CustomColors().getActiveDetailsColor()),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: CustomColors().getActiveDetailsColor()),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: CustomColors().getActiveDetailsColor()),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Forgot password
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Esqueci a minha senha",
                    style: TextStyle(
                      color: CustomColors().getActiveDetailsColor(),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              // Stay connected
              Row(children: [
                Checkbox(
                    value: continueConnected,
                    onChanged: (bool? newValue) {
                      setState(() {
                        continueConnected = newValue!;
                      });
                    }),
                Text(
                  "Permanecer conectado",
                  style: TextStyle(
                    color: CustomColors().getActiveDetailsColor(),
                  ),
                ),
              ]),

              // Login button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors().getActivePrimaryColor()),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: CustomColors().getActiveDetailsColor(),
                  ),
                ),
              ),

              // Line
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  thickness: 0.5,
                  color: CustomColors().getActiveDetailsColor(),
                ),
              ),

              // Sign Up button
              Text(
                "Ainda não possui conta?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: CustomColors().getActiveDetailsColor(),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors().getActiveSecondaryColor()),
                ),
                onPressed: () {},
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                    color: CustomColors().getActivePrimaryColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
