import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<StatefulWidget> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Example'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Isminiz",
                    hintText: "Isim",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  hintText: "mail@",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                validator: (value) {
                  if (!value.toString().contains('@') ||
                      !value.toString().contains('.com')) {
                    return "Lütfen geçerli bir e-mail adresi giriniz.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Sifre",
                  hintText: "sifre",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                validator: (value) {
                  if (value.toString().length < 6) {
                    return 'Şifre en az 6 karakter içermeli';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Form başarıyla gönderildi')),
                    );
                  }
                },
                child:
                    const Text('Gönder', style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
