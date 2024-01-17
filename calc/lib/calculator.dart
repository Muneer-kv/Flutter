import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String output = '0';
  String _output = '0';
  int num1 = 0;
  int num2 = 0;
  String operation = '';

  buttonpress(String buttontext) {
    if (buttontext == 'C') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operation = '0';
    } else if (buttontext == '+' ||
        buttontext == '-' ||
        buttontext == '*' ||
        buttontext == '/') {
      num1 = int.parse(output);
      operation = buttontext;
      _output = '0';
    } else if (buttontext == '=') {
      num2 = int.parse(output);
      if (operation == '+') {
        _output = (num1 + num2).toString();
      }
      if (operation == '-') {
        _output = (num1 - num2).toString();
      }
      if (operation == '*') {
        _output = (num1 * num2).toString();
      }
      if (operation == '/') {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operation = '';
    } else {
      _output = _output + buttontext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget button(String buttontext) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () => buttonpress(buttontext),
              child: Text(buttontext)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding:const EdgeInsets.all(10),
            child: Text(
              output,
              style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
         const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  button('C'),
                  button('<'),
                  button(''),
                  button('/'),
                ],
              ),
              Row(
                children: [
                  button('7'),
                  button('8'),
                  button('9'),
                  button('*'),
                ],
              ),
              Row(
                children: [
                  button('4'),
                  button('5'),
                  button('6'),
                  button('-'),
                ],
              ),
              Row(
                children: [
                  button('1'),
                  button('2'),
                  button('3'),
                  button('+'),
                ],
              ),
              Row(
                children: [
                  button('0'),
                  button('='),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
