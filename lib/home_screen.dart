import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../components/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        answer.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Button(
                            title: 'AC',
                            onPress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            }),
                        Button(
                            title: '+/-',
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            }),
                        Button(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        Button(
                          title: '/',
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            }),
                        Button(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        Button(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        Button(
                          title: 'x',
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            }),
                        Button(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        Button(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            }),
                        Button(
                          title: '-',
                          onPress: () {
                            setState(() {
                              userInput += '-';
                            });
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            title: '1',
                            onPress: () {
                              setState(() {
                                userInput += '1';
                              });
                            }),
                        Button(
                            title: '2',
                            onPress: () {
                              setState(() {
                                setState(() {
                                  userInput += '2';
                                });
                              });
                            }),
                        Button(
                            title: '3',
                            onPress: () {
                              setState(() {
                                userInput += '3';
                              });
                            }),
                        Button(
                          title: '+',
                          onPress: () {
                            setState(() {
                              userInput += '+';
                            });
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                            title: '0',
                            onPress: () {
                              setState(() {
                                userInput += '0';
                              });
                            }),
                        Button(
                            title: '.',
                            onPress: () {
                              setState(() {
                                userInput += '.';
                              });
                            }),
                        Button(
                            title: 'DEL',
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                        Button(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
