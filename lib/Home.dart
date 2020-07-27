import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _nadaSalvo = "Nada Salvo";

  TextEditingController _controllerCampo = TextEditingController();

  _salva() async {

    String _valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", _valorDigitado);

  }
  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nadaSalvo = prefs.get("nome") ?? "Nada Salvo";
    });
  }

  _remover() async{

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              _nadaSalvo,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  onPressed: _salva,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Recuperar",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _recuperar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Remover",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _remover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
