import 'package:flutter/material.dart';

bool isSquare(int number) {
  if (number > 0) {
    for (int i = 1; i * i <= number; i++) {
      if (number % i == 0 && number / i == i) return true;
    }
    return false;
  } else
    return false;
}

bool isCube(int number) {
  for (int i = 1; i < number; i++) {
    if (i * i * i == number) {
      return true;
    }
  }
  return false;
}

String answer(int text) {
  String print = '';

  if (isSquare(text) && isCube(text)) {
    print = 'Number $text is both SQUARE and CUBE';
  } else if (isSquare(text)) {
    print = 'Number $text is SQUARE';
  } else if (isCube(text)) {
    print = 'Number $text is CUBE';
  } else {
    print = 'Number $text is neither SQUARE or CUBE';
  }

  return print;
}

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Number Shapes'),
            backgroundColor: const Color(0xFF2962FF),
          ),
          body: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsetsDirectional.only(
                  start: 16.0,
                  top: 16.0,
                  end: 16.0,
                ),
                child: const Text(
                  'Please enter a number to see if it is square or cube.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  margin: const EdgeInsetsDirectional.all(15.0),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                  )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final String text = controller.text;
              showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(text),
                      content: Text(answer(int.parse(text))),
                    );
                  });
              setState(() {
                controller.clear();
              });
            },
            tooltip: 'Check the number',
            child: const Icon(Icons.done),
          )),
    );
  }
}
