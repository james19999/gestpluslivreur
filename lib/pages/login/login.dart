import 'package:flutter/material.dart';
import 'package:gestlivreur/pages/admin/admin.dart';
import 'package:gestlivreur/pages/services/user_services.dart';
import 'package:gestlivreur/pages/toas/toas.dart';
import 'package:gestlivreur/pages/widgets/input.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool obscur = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/ords.png"),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Entrer vos identifiants de connexion livreur',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  InputFild(
                    icon: Icon(Icons.email),
                    hintText: "Email",
                    controlle: _emailController,
                    validator: (value) =>
                        value!.isEmpty ? "Entrer d'adresse mail ".tr : null,
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  InputFild(
                    icon: Icon(Icons.key),
                    hintText: "Mot de passe",
                    controlle: _passwordController,
                    validator: (value) => value!.isEmpty
                        ? "Entrer votre mot de passe  ".tr
                        : null,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscur = !obscur;
                          });
                        },
                        icon: Icon(
                            obscur ? Icons.visibility : Icons.visibility_off)),
                    obscureText: obscur,
                  ),
                  SizedBox(height: 32.0),
                  Container(
                    height: Get.height * 0.06,
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          var cheked = await UserService().AuthUser(
                            _passwordController.text.trim(),
                            _emailController.text,
                          );

                          if (cheked == true) {
                            Get.off(() => Admin());
                          } else {
                            Toas.getSnackbarEror("",
                                "Erreur de connexion vérifier vos informations.");
                          }
                        }
                      },
                      child: Text('Connectez-vous'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
