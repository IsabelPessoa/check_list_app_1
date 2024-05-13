import 'package:check_list_app_1/values/custom_colors.dart';
import 'package:check_list_app_1/login/util/validation_rules/email_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with EmailValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailTEC = TextEditingController();

  Color topColor = CustomColors().getActiveSecondaryColor();
  Color bottomColor = CustomColors().getActiveTerciaryColor();
  Color primaryColor = CustomColors().getActivePrimaryColor();
  Color secondaryColor = CustomColors().getActiveSecondaryColor();
  Color terciaryColor = CustomColors().getActiveTerciaryColor();
  Color detailsColor = CustomColors().getActiveDetailsColor();

  bool continueConnected = false;
  bool _obscureText = true;

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
                    color: detailsColor,
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
                        style: TextStyle(color: detailsColor),
                        cursorColor: detailsColor,
                        cursorErrorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          labelText: "Insira o seu e-mail",
                          labelStyle: TextStyle(color: detailsColor),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: detailsColor,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: detailsColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: detailsColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: detailsColor),
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
                      obscureText: _obscureText,
                      style: TextStyle(
                        color: detailsColor,
                      ),
                      cursorColor: detailsColor,
                      cursorErrorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        labelText: "Insira a sua senha",
                        labelStyle: TextStyle(
                          color: detailsColor,
                        ),
                        suffixIcon: IconButton(
                          color: detailsColor,
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        prefixIcon: Icon(
                          Icons.key,
                          color: detailsColor,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: detailsColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: detailsColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: detailsColor,
                          ),
                        ),
                      ),
                    ),
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
                      color: detailsColor,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              // Stay connected
              Row(children: [
                Checkbox(
                  checkColor: detailsColor,
                  activeColor: primaryColor,
                  overlayColor: MaterialStateProperty.all(secondaryColor),
                  value: continueConnected,
                  onChanged: (bool? newValue) {
                    setState(() {
                      continueConnected = newValue!;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          detailsColor, // Cor da borda quando selecionado e não selecionado
                      width: 5, // Espessura da borda
                    ),
                    borderRadius: BorderRadius.circular(2), // Raio da borda
                  ),
                ),
                Text(
                  "Permanecer conectado",
                  style: TextStyle(
                    color: detailsColor,
                  ),
                ),
              ]),

              // Login button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: detailsColor,
                  ),
                ),
              ),

              // Line
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  thickness: 0.5,
                  color: detailsColor,
                ),
              ),

              // Sign Up button
              Text(
                "Ainda não possui conta?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: detailsColor,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondaryColor),
                ),
                onPressed: () {},
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                    color: primaryColor,
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
