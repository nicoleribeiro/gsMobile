import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Informacoes.dart';

class Produtos extends StatefulWidget {
  Produtos({Key? key}) : super(key: key);

  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  List<dynamic> _produtos = [];

  _receberProdutos() async {
    http.Response response = await http.get(
      Uri.parse("http://localhost:8085/produtos"),
    );
    setState(() {
      _produtos = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 15, 90, 32),
            title: Text("Produtos")),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              _barraSuperior(context),
              _listaProdutos(),
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

  _barraSuperior(context) {
    return Container(
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage('/AGROTECH.png'), width: 100),
            Flex(
              direction: Axis.horizontal,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Informacoes()));
                  },
                  child: Text(
                    "Fornecedores",
                    style: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27), fontSize: 18),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Informacoes()));
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "Produtos",
                        style: TextStyle(
                            color: Color.fromARGB(255, 27, 27, 27),
                            fontSize: 18),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Informacoes()));
                    },
                    child: Text(
                      "Troca",
                      style: TextStyle(
                          color: Color.fromARGB(255, 27, 27, 27), fontSize: 18),
                    )),
              ],
            ),
            Icon(Icons.menu)
          ],
        ));
  }

  _listaProdutos() {
    if (_produtos.length > 0) {
      return Container(
        child: ListView.builder(
          itemCount: _produtos.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _produtos[index]["nome"],
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          _produtos[index]["descricao"],
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "R\$ ${_produtos[index]["preco"]}",
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text("Nenhum produto encontrado"),
        ),
      );
    }
  }
}
