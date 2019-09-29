import 'package:flutter/material.dart';
void main() {

  runApp(MaterialApp(
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int resultado;

  void somar() {

    int valor1 = int.parse(textEditingController1.text);
    int valor2 = int.parse(textEditingController2.text);

    setState(() {
      this.resultado = valor1 + valor2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text("AppTeste")
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: this.formKey,
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      buildTextFormField(this.textEditingController1, "Valor 1", "Insira primeiro valor"),
                      Divider(),
                      buildTextFormField(this.textEditingController2, "Valor 2", "Insira segundo valor"),
                      Divider(),
                      ButtonTheme(
                        height: 60,
                        child: RaisedButton(
                          onPressed: () {
                            if(this.formKey.currentState.validate()) {

                              somar();
                              print(this.resultado);
                            }
                          },
                          child: Text("Somar", style: TextStyle(color: Colors.white)),
                          color: Colors.green,
                        ),
                      )
                    ]
                )
            ),
          ),
        )
    );
  }

  TextFormField buildTextFormField(TextEditingController textEditingController, String label, String erro) {
    return TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.green, fontSize: 22),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.teal, fontSize: 18)
        ),
        controller: textEditingController,
        validator: (value) {
          if (value.isEmpty) {
            return erro;
          }
        }
    );
  }
}