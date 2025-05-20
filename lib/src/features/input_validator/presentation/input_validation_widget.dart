import 'package:flutter/material.dart';

class InputValidationWidget extends StatefulWidget {
  const InputValidationWidget({super.key});

  @override
  State<InputValidationWidget> createState() => _InputValidationWidgetState();
}

class _InputValidationWidgetState extends State<InputValidationWidget> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    String email = "melli@geyer.de";
    String password = "12345";

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
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "E-Mail",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                autocorrect: false,
                controller: _passwordController,
                obscureText: true,
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
                  if (_emailController.text == email &&
                      _passwordController.text == password) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage()),
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

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Hallo")));
  }
}
