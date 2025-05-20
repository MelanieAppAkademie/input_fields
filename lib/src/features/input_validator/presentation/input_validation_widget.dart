import 'package:flutter/material.dart';

class InputValidationWidget extends StatefulWidget {
  const InputValidationWidget({super.key});

  @override
  State<InputValidationWidget> createState() => _InputValidationWidgetState();
}

class _InputValidationWidgetState extends State<InputValidationWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    String email = "melli@appakademie.com";
    String password = "AppAkademie2025";
    return Scaffold(
      appBar: AppBar(title: Text("Input Validation")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Text(
                "Willkommen beim Batch Login",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                autocorrect: false,
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                autocorrect: false,
                controller: _passwordController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(Icons.visibility),
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint(_passwordController.text);
                  if (_emailController.text == email &&
                      _passwordController.text == password) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login erfolgreich!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login-Daten nicht korrekt!"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
