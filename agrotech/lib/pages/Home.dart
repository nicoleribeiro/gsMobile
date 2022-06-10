import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './FaleConosco.dart';
import './Produtos.dart';
import './Informacoes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 15, 90, 32),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    TextButton(
                      child: Text(
                        'Fale Conosco',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FaleConosco()));
                      },
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Produtos()));
                    },
                    icon: Icon(Icons.shopping_cart))
              ]),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          _barraSuperior(context),
          _banner(),
          _cards(),
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

  _banner() {
    return Container(
        width: double.maxFinite,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("/Banner.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Seu negócio mais tecnológico.\nSua compra mais segura.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Divulgue e venda seus plantios e consiga clientes fiéis.",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text("Faça uma feira de qualidade sem sair de casa.",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                    "Dê um destino ao seu lixo e ainda ganhe adubo para continuar seu cultivo.",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center)),
          ],
        ));
  }

  _cards() {
    return (Wrap(
      direction: Axis.horizontal,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_tree,
                  size: 40, color: Color.fromARGB(255, 15, 90, 32)),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                    "Anuncie seu plantio conosco e ganhe a fidelidade de vários clientes.",
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag,
                  size: 40, color: Color.fromARGB(255, 15, 90, 32)),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                    "Faça a sua feira da seman sem sair de casa e receba produtos fresquinhos sempre que quiser.",
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star,
                  size: 40, color: Color.fromARGB(255, 15, 90, 32)),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                    "Produtos avaliados minuciosamente para garantir sempre a melhor qualidade para quem consome.",
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.compare_arrows_rounded,
                  size: 40, color: Color.fromARGB(255, 15, 90, 32)),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                    "Aqui seu lixo vira adubo e você ainda ganha com isso.",
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
