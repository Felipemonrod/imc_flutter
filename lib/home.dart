import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _altura = TextEditingController();
  TextEditingController _peso = TextEditingController();
  String _resultText = "Teste";
  String _imagePath = "images/1.png";
  Color _resultColor = Colors.grey[300]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculo de IMC", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
    body: GestureDetector(
        onTap: () {
            FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _resultColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Image.asset(
                  _imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: TextField(
                controller: _altura,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: "Digite a sua Altura?",
                  labelStyle: TextStyle(color: Colors.blue[800]),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: TextField(
                controller: _peso,
                keyboardType: TextInputType.numberWithOptions(),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Digite o seu peso?",
                  labelStyle: TextStyle(color: Colors.blue[800]),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                ),
                onPressed: () {
                  double valorAltura = double.parse(
                    _altura.text.isEmpty
                        ? "0.0"
                        : _altura.text.replaceAll(",", "."),
                  );
                  double valorPeso = double.parse(
                    _peso.text.isEmpty
                        ? "0.0"
                        : _peso.text.replaceAll(",", "."),
                  );

                  double resultado = valorPeso / (valorAltura * valorAltura) ;

                  setState(() {
                    
                    if (resultado <= 18.5) {
                      _resultText = "Abaixo do Peso";
                      _imagePath = "images/2.png";
                      _resultColor = Colors.lightBlue;
                    } else if(resultado >= 18.6 && resultado <=24.9) {
                      _resultText = "Peso ideal";
                      _imagePath = "images/3.png";
                      _resultColor = Colors.green;
                    }
                    else if(resultado >= 25.0 && resultado <= 29.9 ){
                      _resultText = 'Levemente acima do peso';
                      _imagePath = "images/4.png";
                      _resultColor = Colors.yellow[700]!;
                    }
                    else if (resultado >= 30.0 && resultado <=34.9){
                      _resultText = 'Obsedidade Grau 1';
                      _imagePath = "images/5.png";
                      _resultColor = Colors.orange;
                    }
                    else if (resultado >= 35.0 && resultado <=39.9){
                      _resultText = 'Obsedidade Grau 2';
                      _imagePath = "images/6.png";
                      _resultColor = Colors.deepOrange;
                    }
                    else if (resultado >= 40.0){
                      _resultText = 'Obsedidade Grau 3';
                      _imagePath = "images/7.png";
                      _resultColor = Colors.red;
                    }
                    
                  }
                  );
                },
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                _resultText,
                style: TextStyle(color: Colors.blue[800], fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ) 

    );
  }
}
