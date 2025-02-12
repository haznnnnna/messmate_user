import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:messmate_user/core/constants/colorconstant.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController sendMsgController = TextEditingController();
  final ChatbotService _chatbotService = ChatbotService();
  List<Map<String, String>> messages = [];

  void sendMessage() async {
    String userMessage = sendMsgController.text;
    setState(() {
      messages.add({"sender": "user", "message": userMessage});
    });

    sendMsgController.clear();
    String botResponse = await _chatbotService.getChatResponse(userMessage);

    setState(() {
      messages.add({"sender": "bot", "message": botResponse});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
        centerTitle: true,
        backgroundColor: ColorConstant.whiteColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]['message']!),
                  subtitle:
                      Text(messages[index]['sender'] == 'user' ? "You" : "Bot"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: sendMsgController,
                    decoration: InputDecoration(hintText: "Type a message..."),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatbotService {
  final String apiKey = 'your_openai_api_key';
  final String apiUrl = 'https://api.openai.com/v1/chat/completions';

  Future<String> getChatResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": message}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return "Error: ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
