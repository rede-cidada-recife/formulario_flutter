import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Cadastrar pessoas';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorIdade = TextEditingController();

  void _salvar() {
    setState(() {
      final String nome = _controladorNome.text;
      final String email = _controladorEmail.text;
      final int? idade = int.tryParse(_controladorIdade.text);

      final Pessoa pessoaCad = Pessoa(nome, email, idade);
      //print(pessoaCad);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content:  Text('Dados enviados com sucesso!'),
            );
          },
       );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar pessoa'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controladorNome,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controladorEmail,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controladorIdade,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      Colors.blue, //change background color of button
                  backgroundColor: Colors.white, //change text color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                onPressed: _salvar,
                child: const Text('Enviar dados'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class Pessoa {
  final String nome;
  final String email;
  final int? idade;

  Pessoa(
    this.nome,
    this.email,
    this.idade,
  );

  @override
  String toString() {
    return 'Pessoa{nome: $nome, email: $email, idade: $idade}';
  }
}
