import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class FaleConosco extends StatefulWidget {
  FaleConosco({Key? key}) : super(key: key);

  @override
  _FaleConoscoState createState() => _FaleConoscoState();
}

class _FaleConoscoState extends State<FaleConosco> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _mensagemController = TextEditingController();
  TextEditingController _assuntoController = TextEditingController();
  String _motivoController = "Motivo do contato";

  String _textoAposEnvio = "";

  _enviarFormulario() async {
    http.Response response = await http.post(
      Uri.parse("http://localhost:8085/faleconosco"),
      body: {
        "nome": _nomeController.text,
        "email": _emailController.text,
        "telefone": _telefoneController.text,
        "mensagem": _mensagemController.text,
        "assunto": _assuntoController.text,
        "motivo": _motivoController,
      },
    );
    _textoAposEnvio = "Mensagem enviada com sucesso!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 15, 90, 32),
            title: Text("Fale Conosco")),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              _texto(),
              _form(),
              Text(
                _textoAposEnvio,
                style: TextStyle(color: Colors.green),
              )
            ])),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          color: Color.fromARGB(255, 15, 90, 32),
          child: Text(
            "AgroTech © | Seu negócio tecnológico. Sua compra mais segura.",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }

  _texto() {
    return (Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text(
              "Está com dúvida, tem uma sugestão ou uma reclamação? Entre em contato conosco pelo formulário abaixo que responderemos sua mensagem o mais breve possível.",
              style: TextStyle(
                  color: Color.fromARGB(255, 27, 27, 27), fontSize: 16)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: Text(
              "Nosso prazo de resposta é em até 7 dias úteis. É importante que todos os campos de contato sejam preenchidos corretamente pois é por eles que tentaremos falar com você.",
              style: TextStyle(
                  color: Color.fromARGB(255, 27, 27, 27), fontSize: 16)),
        )
      ],
    ));
  }

  _form() {
    return (Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _nomeController,
            decoration: InputDecoration(
              labelText: 'Nome',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 27, 27, 27),
                fontSize: 16,
              ),
            ),
            style: TextStyle(
              color: Color.fromARGB(255, 27, 27, 27),
              fontSize: 16,
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 27, 27, 27),
                fontSize: 16,
              ),
            ),
            style: TextStyle(
              color: Color.fromARGB(255, 27, 27, 27),
              fontSize: 16,
            ),
          ),
          TextFormField(
            controller: _telefoneController,
            decoration: InputDecoration(
              labelText: 'Telefone',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 27, 27, 27),
                fontSize: 16,
              ),
            ),
            style: TextStyle(
              color: Color.fromARGB(255, 27, 27, 27),
              fontSize: 16,
            ),
          ),
          Container(
            width: double.maxFinite,
            child: DropdownButton<String>(
              value: _motivoController,
              items: <String>[
                'Motivo do contato',
                'Motivo 01',
                'Motivo 02',
                'Motivo 03',
                'Motivo 04',
                'Motivo 05',
                'Motivo 06'
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _motivoController = value.toString();
                });
              },
            ),
          ),
          TextFormField(
            controller: _assuntoController,
            decoration: InputDecoration(
              labelText: 'Assunto',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 27, 27, 27),
                fontSize: 16,
              ),
            ),
            style: TextStyle(
              color: Color.fromARGB(255, 27, 27, 27),
              fontSize: 16,
            ),
          ),
          TextFormField(
            controller: _mensagemController,
            decoration: InputDecoration(
              labelText: 'Mensagem',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 27, 27, 27),
                fontSize: 16,
              ),
            ),
            style: TextStyle(
              color: Color.fromARGB(255, 27, 27, 27),
              fontSize: 16,
            ),
          ),
          _botao(),
        ],
      ),
    ));
  }

  _botao() {
    return (Padding(
      padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
      child: RaisedButton(
        color: Color.fromARGB(255, 202, 156, 96),
        child: Text(
          'Enviar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          _enviarFormulario();
        },
      ),
    ));
  }
}
