import 'package:flutter/material.dart';
import 'package:mips_mais/presentation/widgets/CustomInputField.dart';

class CriarContaScreen extends StatelessWidget {
  const CriarContaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController telefoneController = TextEditingController();
    final TextEditingController distritoController = TextEditingController();
    final TextEditingController igrejaController = TextEditingController();
    final TextEditingController funcaoController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFEFF2FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFF2FB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0B1121)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Criar conta',
          style: TextStyle(
            color: Color(0xFF0B1121),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomInputField(
            controller: telefoneController,
            label: 'Seu telefone',
            hint: 'Telefone',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          CustomInputField(
            controller: distritoController,
            label: 'Seu distrito',
            hint: 'Distrito',
          ),
          const SizedBox(height: 16),
          CustomInputField(
            controller: igrejaController,
            label: 'Igreja',
            hint: 'Igreja',
          ),
          const SizedBox(height: 16),
          CustomInputField(
            controller: funcaoController,
            label: 'Sua função',
            hint: 'Qual sua função na igreja',
            prefixIcon: const Icon(Icons.person_outline),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0B1121),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                // ação ao criar conta
              },
              child: const Text('Criar Conta', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
