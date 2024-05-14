import 'package:check_list_app_1/values/custom_colors.dart';
import 'package:check_list_app_1/login/util/validation_rules/email_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class DataInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    var buffer = StringBuffer();
    var count = 0;
    for (int i = 0; i < text.length && i < 8; i++) {
      if ((count == 2 || count == 4) && text[i] != '/') {
        buffer.write('/');
      }
      if (text[i] != '/' && int.tryParse(text[i]) != null) {
        buffer.write(text[i]);
        count++;
      }
    }

    var string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => SingUpScreenState();
}

class SingUpScreenState extends State<SingUpScreen> with EmailValidationMixin {
  Color topColor = CustomColors().getActiveSecondaryColor();
  Color bottomColor = CustomColors().getActiveTerciaryColor();
  Color primaryColor = CustomColors().getActivePrimaryColor();
  Color secondaryColor = CustomColors().getActiveSecondaryColor();
  Color terciaryColor = CustomColors().getActiveTerciaryColor();
  Color quaternaryColor = CustomColors().getActiveQuaternaryColor();
  Color detailsColor = CustomColors().getActiveDetailsColor();

  double columnSpace = 15;

  bool showPassword = false;
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
              primaryColor,
              quaternaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Text(
                  "Cadastro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: detailsColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // First Name
              Padding(
                padding: EdgeInsets.only(
                  bottom: columnSpace,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: detailsColor),
                        cursorColor: detailsColor,
                        cursorErrorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          labelText: "Insira o seu nome",
                          labelStyle: TextStyle(color: detailsColor),
                          prefixIcon: Icon(
                            Icons.person,
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
                      )
                    ],
                  ),
                ),
              ),

              // Last Name
              Padding(
                padding: EdgeInsets.only(
                  bottom: columnSpace,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: detailsColor),
                        cursorColor: detailsColor,
                        cursorErrorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          labelText: "Insira o seu sobrenome",
                          labelStyle: TextStyle(color: detailsColor),
                          prefixIcon: Icon(
                            Icons.person,
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
                      )
                    ],
                  ),
                ),
              ),

              // Date of Birth
              Padding(
                padding: EdgeInsets.only(
                  bottom: columnSpace,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter(),
                        ],
                        style: TextStyle(color: detailsColor),
                        cursorColor: detailsColor,
                        cursorErrorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          labelText: "Insira a sua data de nascimento",
                          labelStyle: TextStyle(color: detailsColor),
                          prefixIcon: Icon(
                            Icons.calendar_today,
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
                      )
                    ],
                  ),
                ),
              ),

              // E-mail
              Padding(
                padding: EdgeInsets.only(
                  bottom: columnSpace,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
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
                      )
                    ],
                  ),
                ),
              ),
              // Password
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: columnSpace),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        style: TextStyle(
                          color: detailsColor,
                        ),
                        cursorColor: detailsColor,
                        cursorErrorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          labelText: "Crie a sua senha",
                          labelStyle: TextStyle(
                            color: detailsColor,
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
              ),

              // Confirm Password
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: columnSpace),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        style: TextStyle(
                          color: detailsColor,
                        ),
                        cursorColor: detailsColor,
                        cursorErrorColor: Colors.redAccent,
                        decoration: InputDecoration(
                          labelText: "Confirme a sua senha",
                          labelStyle: TextStyle(
                            color: detailsColor,
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
              ),

              Row(children: [
                Checkbox(
                  checkColor: detailsColor,
                  activeColor: primaryColor,
                  overlayColor: MaterialStateProperty.all(secondaryColor),
                  value: showPassword,
                  onChanged: (bool? newValue) {
                    setState(() {
                      showPassword = newValue!;
                      _obscureText = !_obscureText;
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
                  "Mostrar a senha",
                  style: TextStyle(
                    color: detailsColor,
                  ),
                ),
              ]),

              // SignUp button
              Padding(
                padding: EdgeInsets.only(top: columnSpace),
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                ),
                onPressed: () {},
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                    color: detailsColor,
                  ),
                ),
              ),

              // Line
              Padding(
                padding: EdgeInsets.symmetric(vertical: columnSpace),
                child: Divider(
                  thickness: 0.5,
                  color: detailsColor,
                ),
              ),

              // Login button
              Text(
                "Já possui uma conta?",
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Entre com a sua conta",
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
