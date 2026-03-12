import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/service/chat_service.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  final ChatService _chatService = ChatService();
  final TextEditingController messageController = TextEditingController();

  bool _isSending = false;
  bool get isSending => _isSending;

  Stream<List<MessageModel>> getMessages(String receiverUid) {
    return _chatService.getMessages(receiverUid);
  }

  Future<void> sendMessage(String receiverUid) async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    _isSending = true;
    notifyListeners();

    try {
      await _chatService.sendMessage(receiverUid: receiverUid, text: text);
      messageController.clear();
    } catch (e) {
      debugPrint('Send error: $e');
    }

    _isSending = false;
    notifyListeners();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}