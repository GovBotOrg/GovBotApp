import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';

class ChatBot extends StatefulWidget {
  final String msg;

  ChatBot({required this.msg});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  bool loading = false;
  List<Map<String, String>> textChat = [];
  List<Map<String, String>> textWithImageChat = [];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  final gemini = GoogleGemini(apiKey: apiKey!);

  @override
  void initState() {
    super.initState();
    if (widget.msg.isNotEmpty) {
      // If a message is provided, send it as the first query
      fromText(query: widget.msg);
    }
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _textController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void fromText({required String query}) {
    setState(() {
      loading = true;
      textChat.add({
        "role": "User",
        "text": query,
      });
      _textController.clear();
    });
    scrollToTheEnd();

    gemini.generateFromText(query).then((value) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "Gemini",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "Gemini",
          "text": error.toString(),
        });
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Get updated info on this topic"),
          Expanded(
            child: ListView.builder(
              controller: _controller, // Attach the controller here
              itemCount: textChat.length,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                return loading
                    ? Center(
                  child: Lottie.asset('assets/bubble.json'),
                )
                    : ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    child: Text(
                      textChat[index]["role"]!.substring(0, 1),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    textChat[index]["role"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(textChat[index]["text"]!),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.transparent,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                IconButton(
                  icon: loading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.send),
                  onPressed: () {
                    fromText(query: _textController.text);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}









// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_gemini/google_gemini.dart';
// import 'package:lottie/lottie.dart';
//
// import 'package:ollygemini/main.dart';
//
// class ChatBot extends StatefulWidget {
//   // const ChatBot({
//   //   super.key,
//   // });
//   final String msg;
//
//   ChatBot({required this.msg});
//
//
//   @override
//   State<ChatBot> createState() => _ChatBotState();
// }
//
// class _ChatBotState extends State<ChatBot> {
//   bool loading = false;
//   List textChat = [];
//   List textWithImageChat = [];
//
//   final TextEditingController _textController = TextEditingController();
//   final ScrollController _controller = ScrollController();
//
//   // Create Gemini Instance
//   final gemini = GoogleGemini(
//     apiKey: apiKey!,
//   );
//
//   // Text only input
//   void fromText({required String query}) {
//     setState(() {
//       loading = true;
//       textChat.add({
//         "role": "User",
//         "text": query,
//       });
//       _textController.clear();
//     });
//     scrollToTheEnd();
//
//     gemini.generateFromText(query).then((value) {
//       setState(() {
//         loading = false;
//         textChat.add({
//           "role": "Gemini",
//           "text": value.text,
//         });
//       });
//       scrollToTheEnd();
//     }).onError((error, stackTrace) {
//       setState(() {
//         loading = false;
//         textChat.add({
//           "role": "Gemini",
//           "text": error.toString(),
//         });
//       });
//       scrollToTheEnd();
//     });
//   }
//
//   void scrollToTheEnd() {
//     _controller.jumpTo(_controller.position.maxScrollExtent);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: Column(
//
//           children: [
//             Text("Get updated info on this topic"),
//
//             Expanded(
//               child: ListView.builder(
//                 controller: _controller,
//                 itemCount: textChat.length,
//                 padding: const EdgeInsets.only(bottom: 20),
//                 itemBuilder: (context, index) {
//                   return loading
//                       ? Center(
//                     child: Lottie.asset('assets/bubble.json'),
//                   )
//                       : ListTile(
//                     isThreeLine: true,
//                     leading: CircleAvatar(
//                       child: Text(
//                         textChat[index]["role"].substring(0, 1),
//                         style:
//                         const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     title: Text(
//                       textChat[index]["role"],
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(textChat[index]["text"]),
//                   );
//                 },
//               ),
//             ),
//             Container(
//               alignment: Alignment.bottomRight,
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _textController,
//                       decoration: InputDecoration(
//                         hintText: "Type a message",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: BorderSide.none),
//                         fillColor: Colors.transparent,
//                       ),
//                       maxLines: null,
//                       keyboardType: TextInputType.multiline,
//                     ),
//                   ),
//                   IconButton(
//                     icon: loading
//                         ? const CircularProgressIndicator()
//                         : const Icon(Icons.send),
//                     onPressed: () {
//                       fromText(query: _textController.text);
//                     },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }












//
// import 'package:flutter/material.dart';
// import 'package:google_gemini/google_gemini.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../main.dart';
// class ChatBot extends StatefulWidget {
//   final String msg;
//
//   ChatBot({required this.msg});
//
//   @override
//   State<ChatBot> createState() => _ChatBotState();
// }
//
// class _ChatBotState extends State<ChatBot> {
//   bool loading = false;
//   List textChat = [];
//   List textWithImageChat = [];
//
//   final TextEditingController _textController = TextEditingController();
//   final ScrollController _controller = ScrollController();
//
//   final gemini = GoogleGemini(
//     apiKey: apiKey!,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.msg.isNotEmpty) {
//       // If a message is provided, send it as the first query
//       fromText(query: widget.msg);
//     }
//   }
//
//   void fromText({required String query}) {
//     setState(() {
//       loading = true;
//       textChat.add({
//         "role": "User",
//         "text": query,
//       });
//       _textController.clear();
//     });
//     scrollToTheEnd();
//
//     gemini.generateFromText(query).then((value) {
//       setState(() {
//         loading = false;
//         textChat.add({
//           "role": "Gemini",
//           "text": value.text,
//         });
//       });
//       scrollToTheEnd();
//     }).onError((error, stackTrace) {
//       setState(() {
//         loading = false;
//         textChat.add({
//           "role": "Gemini",
//           "text": error.toString(),
//         });
//       });
//       scrollToTheEnd();
//     });
//   }
//
//   void scrollToTheEnd() {
//     _controller.jumpTo(_controller.position.maxScrollExtent);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text("Get updated info on this topic"),
//           Expanded(
//             child: ListView.builder(
//               controller: _controller,
//               itemCount: textChat.length,
//               padding: const EdgeInsets.only(bottom: 20),
//               itemBuilder: (context, index) {
//                 return loading
//                     ? Center(
//                   child: Lottie.asset('assets/bubble.json'),
//                 )
//                     : ListTile(
//                   isThreeLine: true,
//                   leading: CircleAvatar(
//                     child: Text(
//                       textChat[index]["role"].substring(0, 1),
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   title: Text(
//                     textChat[index]["role"],
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(textChat[index]["text"]),
//                 );
//               },
//             ),
//           ),
//           Container(
//             alignment: Alignment.bottomRight,
//             margin: const EdgeInsets.all(20),
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               border: Border.all(color: Colors.grey),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textController,
//                     decoration: InputDecoration(
//                       hintText: "Type a message",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide.none,
//                       ),
//                       fillColor: Colors.transparent,
//                     ),
//                     maxLines: null,
//                     keyboardType: TextInputType.multiline,
//                   ),
//                 ),
//                 IconButton(
//                   icon: loading
//                       ? const CircularProgressIndicator()
//                       : const Icon(Icons.send),
//                   onPressed: () {
//                     fromText(query: _textController.text);
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
