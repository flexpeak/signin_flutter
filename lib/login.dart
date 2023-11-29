import 'package:flutter/material.dart';
import 'package:flutter_formularios/cadastre_se.dart';

class Login extends StatelessWidget {
  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Login({super.key});

  InputDecoration getFieldDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          // Imagem de fundo
          Image.asset(
            'assets/pattern.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Logo do Sistema
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 160,
                        ),
                      ),
                      const Text(
                        'Aplicativo de Vendas',
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  // Formulário
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _emailController,
                              decoration: getFieldDecoration('Email', Icons.email),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: getFieldDecoration('Senha', Icons.lock),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('validado com sucesso');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  fixedSize: const Size(200, 60),
                                ),
                                child: const Text('LOGIN'),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CadastreSe(),
                                  ),
                                );
                              },
                              child: const Text('CADASTRE-SE AQUI'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
