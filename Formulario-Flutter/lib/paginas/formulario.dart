import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorIdade = TextEditingController();

  void _salvar() {
    setState(() {
      final String nome = _controladorNome.text;
      final String email = _controladorEmail.text;
      int? idade = int.tryParse(_controladorIdade.text);
     
      final Pessoa pessoaCad = Pessoa(nome, email, idade);

      String _mensagem = '';
      
      if (pessoaCad.nome.isNotEmpty && pessoaCad.email.isNotEmpty && pessoaCad.idade != null && pessoaCad.idade.toString().isNotEmpty) {
         _mensagem = 'Dados enviados com sucesso para ' + pessoaCad.toString();
      } else {
         _mensagem = 'Favor informar todos os dados';
      }
     
      //print(pessoaCad);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Informativo!'),
          content: Text(
            _mensagem, 
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
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
    return 'Pessoa {nome: $nome, email: $email, idade: $idade}';
  }
}
