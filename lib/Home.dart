import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // TextEditingController _alcoolController = TextEditingController(); // ANTES
  // TextEditingController _gasolinaController = TextEditingController();  //ANTES

  // USANDO A BIBLIOTECA flutter_masked_text
  TextEditingController _alcoolController = MoneyMaskedTextController( //DEPOIS
      decimalSeparator: '.', thousandSeparator: ',', precision: 2);
  TextEditingController _gasolinaController = MoneyMaskedTextController( //DEPOIS
      decimalSeparator: '.', thousandSeparator: ',', precision: 2);

  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_alcoolController.text);
    double precoGasolina = double.tryParse(_gasolinaController.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com Alcool";
        });
      }

      //MÉTODO QUE LIMPARIA OS CAMPOS AO APERTAR O BOTÃO
      //_limparCampos();
    }
  }
  
  void _limparCampos() {
    _alcoolController.text = "";
    _gasolinaController.text = "";
  }

  @override
  Widget build(BuildContext context) {

    Color getColor() {
      if( _textoResultado == "Melhor abastecer com Gasolina") {
        return Colors.red;
      }else{
        return Colors.green;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                //child: Image.asset("images/logo.png"),
                child: Image.asset("images/logo2.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
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
                //maxLength: 5,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                ),
                controller: _alcoolController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina",
                ),
                //maxLength: 4,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                ),
                controller: _gasolinaController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: getColor(),
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
