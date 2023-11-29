import 'package:flutter/material.dart';
import 'package:flutter_formularios/vendas_datepicker.dart';

class CadastreSe extends StatelessWidget {
  // Controladores para os campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  CadastreSe({super.key});

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
        title: const Text('Cadastre-se'),
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
                              controller: _nameController,
                              decoration: getFieldDecoration('Nome', Icons.person),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
                            VendasDatepicker(label: 'Data de Nascimento', controller: _dateOfBirthController, icon: Icons.calendar_month),
                            const SizedBox(
                              height: 20,
                            ),
                            DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: 'M',
                                  child: Text('Masculino'),
                                ),
                                DropdownMenuItem(
                                  value: 'F',
                                  child: Text('Feminino'),
                                ),
                              ],
                              onChanged: (value) {
                                // Lógica ao selecionar o estado
                              },
                              decoration: getFieldDecoration('Sexo', Icons.person_pin_rounded),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Confirmação'),
                                        content: const Text('Tem certeza que os dados estão corretos?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);

                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Enviando dados para API'),
                                                  ),
                                                );
                                              },
                                              child: const Text('Sim')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Não')),
                                        ],
                                      ),
                                    );
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
                                child: const Text('CADASTRAR-SE'),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Voltar para Login'),
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
