import 'package:flutter/material.dart';

class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        //backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Álcool",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _alcoolController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _gasolinaController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: RaisedButton(
                  child: Text("Calcular",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    ),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Resultado",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
