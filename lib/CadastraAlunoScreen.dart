import 'package:flutter/material.dart';

class CadastraAlunoScreen extends StatelessWidget {
  const CadastraAlunoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final telefoneController = TextEditingController();
    final enderecoController = TextEditingController();
    final emailController = TextEditingController();
    final tipoEstudoController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF0B1121),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1121),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cadastra aluno',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF2FB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.image_outlined, size: 40, color: Colors.black38),
                  SizedBox(height: 8),
                  Text(
                    'Add Cover Image',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Dados do Aluno',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          _inputField(controller: nomeController, hint: 'Nome'),
          const SizedBox(height: 12),
          _inputField(controller: telefoneController, hint: 'Telefone'),
          const SizedBox(height: 12),
          _inputField(controller: enderecoController, hint: 'Endereço'),
          const SizedBox(height: 12),
          _inputField(controller: emailController, hint: 'Email'),
          const SizedBox(height: 12),
          _inputField(controller: tipoEstudoController, hint: 'Tipo de estudo'),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0B1121),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                // ação de cadastro
              },
              child: const Text(
                'Adicionar aluno',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
