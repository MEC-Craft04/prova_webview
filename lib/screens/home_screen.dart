import 'package:flutter/material.dart';
import 'package:prova_webview/screens/webview_screen.dart';

class HomeScreen extends StatelessWidget {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              const Text('Ehi bro!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Non prendermi per il culo!';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                labelText: 'URL',
                hintText: 'Inserisci un URL',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.link),
              ),),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  String url = _controller.text;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewScreen(url: url)));
                }
              }, 
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              child: const Text('Invia', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),)
            ],),
          ),
        ),
      ),
    );
  }
}