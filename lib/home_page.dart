import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum = 0;
  int secondnum = 0;
  String texttodisplay = "";
  late String result;
  late String operand;
  void buttonclicked(String buttonValue) {
    if (buttonValue == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      result = "";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "x" ||
        buttonValue == "/") {
      firstnum = int.parse(texttodisplay);
      result = "";
      operand = buttonValue;
    } else if (buttonValue == "=") {
      secondnum = int.parse(texttodisplay);
      if (operand == "+") {
        result = (firstnum + secondnum).toString();
      }
      if (operand == "-") {
        result = (firstnum - secondnum).toString();
      }
      if (operand == "x") {
        result = (firstnum * secondnum).toString();
      }
      if (operand == "/") {
        result = (firstnum / secondnum).toString();
      }
    } else {
      result = int.parse(texttodisplay + buttonValue).toString();
    }

    setState(() {
      texttodisplay = result;
    });
  }

  Widget custombutton(String buttonValue) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            onPressed: () => buttonclicked(buttonValue),
            child: Text(
              "$buttonValue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(15),
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
