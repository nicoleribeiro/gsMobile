import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './FaleConosco.dart';
import './Produtos.dart';

class Informacoes extends StatelessWidget {
  const Informacoes({Key? key}) : super(key: key);

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
                      Icons.info,
                      color: Colors.white,
                    ),
                    TextButton(
                      child: Text(
                        'Informações',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
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
          _info01(),
          _info02(),
          _info03(),
          _info04(),
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

  _info01() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: double.maxFinite,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Image(
            image: AssetImage('/Feira.png'),
            height: 275,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 168, 204, 219),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                    text:
                        "Tem uma horta em casa, uma planta que dá frutos ou qualquer plantio que possa te dar algum retorno financeiro e nao tem uma base boa de clientes? Aumente seu alcance para a cidade toda.",
                  ),
                  overflow: TextOverflow.clip),
              _botao("Divulgue conosco"),
            ],
          ),
        )
      ]),
    );
  }

  _info02() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: double.maxFinite,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Image(
            image: AssetImage('/Compra_de_casa.png'),
            height: 275,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 168, 204, 219),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                    text:
                        "Faça a sua feira do conforto da sua casa e poupe seu tempo e esforço de ficar procurando produtos com o melhor preço e qualidade.",
                  ),
                  overflow: TextOverflow.clip),
              _botao("Conheça nossos produtos"),
            ],
          ),
        ),
      ]),
    );
  }

  _info03() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: double.maxFinite,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Image(
            image: AssetImage('/Frutas.png'),
            height: 275,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 168, 204, 219),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                    text:
                        "Nós avaliamos tudo que anunciamos. Temos uma equipe de controle de qualidade que está a todo momento verificando o estado dos produtos em nosso estoque para garantir sempre a melhor experiência de consumo.",
                  ),
                  overflow: TextOverflow.clip),
              _botao("Divulgue conosco"),
            ],
          ),
        )
      ]),
    );
  }

  _info04() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: double.maxFinite,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Image(
            image: AssetImage('/Plantio.png'),
            height: 275,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 168, 204, 219),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                    text:
                        "Perdeu o caminhão do lixo? Nós damos um destino para o seu lixo. Aqui o seu lixo vira adubo para nossos fornecedores continuarem plantando. Nós buscamos na sua casa e você ganha fichas para troca de produtos futuramente.",
                  ),
                  overflow: TextOverflow.clip),
              _botao("Conheça o programa"),
            ],
          ),
        ),
      ]),
    );
  }

  _botao(texto) {
    return (Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 25),
      child: RaisedButton(
        color: Color.fromARGB(255, 202, 156, 96),
        child: Text(
          texto,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        onPressed: () {},
      ),
    ));
  }
}
