import 'package:aula1/card.dart';
import 'package:aula1/model/Pessoa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Criar Pessoa",
      home: const TelaInicial(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerSobrenome = TextEditingController();
  final TextEditingController controllerIdade = TextEditingController();
  final TextEditingController controllerCPF = TextEditingController();

  final List<Pessoa> listaP = [];

  void removerPessoa(int index) {
    setState(() {
      listaP.removeAt(index);
    });
  }

  void adicionarPessoa(String nome, int idade, String sobrenome, String cpf) {
    setState(() {
      listaP.add(Pessoa(nome: nome, idade: idade, sobrenome: sobrenome, cpf: cpf));
    });
  }

  void abrirModalAdicionarPessoa(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Adicionar Pessoa",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              _buildTextField(controllerNome, "Nome"),
              _buildTextField(controllerSobrenome, "Sobrenome"),
              _buildTextField(controllerIdade, "Idade", keyboardType: TextInputType.number, lengthLimit: 2),
              _buildTextField(controllerCPF, "CPF", keyboardType: TextInputType.number, lengthLimit: 11),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  adicionarPessoa(
                    controllerNome.text,
                    int.parse(controllerIdade.text),
                    controllerSobrenome.text,
                    controllerCPF.text,
                  );
                  _limparCampos();
                  Navigator.pop(context); // Fechar o modal
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text("Adicionar Pessoa", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  TextField _buildTextField(
    TextEditingController controller,
    String labelText, {
    TextInputType keyboardType = TextInputType.text,
    int? lengthLimit,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.deepPurple),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  void _limparCampos() {
    controllerNome.clear();
    controllerSobrenome.clear();
    controllerIdade.clear();
    controllerCPF.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Pessoas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: const Color.fromARGB(255, 196, 11, 11),

        child: Center(
          child: SizedBox(
            width: 900,
            child: ListView.builder(
              itemCount: listaP.length,
              itemBuilder: (context, index) {
                return Cards ( 
                  nome: listaP[index].nome,
                  sobrenome: listaP[index].sobrenome,
                  idade: listaP[index].idade.toString(),
                  CPF: listaP[index].cpf,
                  onRemove: () => removerPessoa(index),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => abrirModalAdicionarPessoa(context),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
