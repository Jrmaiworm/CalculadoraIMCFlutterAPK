import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String? errorText;
  String _infoText = "Informe seus dados!";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados!";
       final player =  AudioCache ();
      player.play('click.mp3');
    });
  }

  void calculate() {
    setState(() {
      double weigth = double.parse(weightController.text);
      double heigth = double.parse(heightController.text) / 100;
      double imc = weigth / (heigth * heigth);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Você está muito magro, parceiro!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final player =  AudioCache ();
                        player.play('click.mp3');
                      },
                      child: Text("sair")),
                ],
                content: Container(
                    child: Image.asset('assets/images/romario.jpg'))));
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal parabens! (${imc.toStringAsPrecision(4)})";
         showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Parabens você está no peso ideal!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final player =  AudioCache ();
                        player.play('click.mp3');
                      },
                      child: Text("sair")),
                ],
                content: Container(
                    child: Image.asset('assets/images/eu.jpeg'))));
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso! (${imc.toStringAsPrecision(4)})";
         showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Oloco Bicho, tá gorrrrdo hein !'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final player =  AudioCache ();
                        player.play('click.mp3');
                      },
                      child: Text("sair")),
                ],
                content: Container(
                    child: Image.asset('assets/images/faustao.jpg'))));

      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade GRAU 1 ! (${imc.toStringAsPrecision(4)})";
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Gordo pra caraca !'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final player =  AudioCache ();
                        player.play('click.mp3');
                      },
                      child: Text("sair")),
                ],
                content: Container(
                    child: Image.asset('assets/images/igordao.jpg'))));

      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade GRAU 2 ! (${imc.toStringAsPrecision(4)})";
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Você precisa de uma dieta sem carboidratos, perca 25 kilos e volte a calculadora!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final player =  AudioCache ();
                        player.play('click.mp3');
                      },
                      child: Text("sair")),
                ],
                content: Container(
                    child: Image.asset('assets/images/drtriste.jpg'))));
      } else if (imc >= 40) {
        _infoText =
            "Obesidade GRAU 3 Muito gordo msm ! (${imc.toStringAsPrecision(4)})";
             showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text('Você deve ser o maior gordo da galaxia !'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final player =  AudioCache ();
                        player.play('mouse.mp3');
                      },
                      child: Text("sair")),
                ],
                content: Container(
                    child: Image.asset('assets/images/jabba.jpg'))));

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculador de IMC"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: Icon(Icons.refresh)),
          
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/drnow.jpg'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 15),
                controller: weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (Cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 15),
                controller: heightController,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed:
                      calculate,
                      
                  
                  child: Text("Calcular"),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(50, 50),
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
            ]),
      ),
    );
  }
}
