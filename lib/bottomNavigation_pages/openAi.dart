import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class SupoortAi extends StatefulWidget {
  const SupoortAi({super.key});

  @override
  State<SupoortAi> createState() => _SupoortAiState();
}

class _SupoortAiState extends State<SupoortAi> {
  // Future<void> main() async {
  //   await dotenv.load();
  // }
  late final TextEditingController promptController;
  String responseTxt = '';
// ResponseModel _responseModel;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343541),
      appBar: AppBar(
        title: Text("Flutter and ChatGPT"),
        backgroundColor: Color(0xff343541),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PromptBldr(responseTxt: responseTxt),
          // TextFormFieldBldr(
          //     promptController: promptController, btnFun: );
        ],
      ),
    );
  }
}

class TextFormFieldBldr extends StatelessWidget {
  const TextFormFieldBldr(
      {super.key, required this.promptController, required this.btnFun});

  final TextEditingController promptController;
  final Function btnFun;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 50),
          child: Row(
            children: [
              Flexible(
                  child: TextField(
                cursorColor: Colors.white,
                controller: promptController,
                autofocus: true,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    filled: true,
                    fillColor: Colors.amber,
                    hintText: 'Ask me Anything',
                    hintStyle: TextStyle(color: Colors.yellow)),
              ))
            ],
          ),
        ));
  }
}

class PromptBldr extends StatelessWidget {
  const PromptBldr({
    super.key,
    required this.responseTxt,
  });
  final String responseTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.35,
      color: Colors.green,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Text(
              responseTxt,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }
}
