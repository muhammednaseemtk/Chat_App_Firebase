import 'package:chat_app/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getChatRoomId(String uid1, String uid2) {
    final sorted = [uid1, uid2]..sort();
    return sorted.join('_');
  }

  // Send message
  Future<void> sendMessage({
    required String receiverUid,
    required String text,
  }) async {
    final sender = _auth.currentUser!;
    final chatRoomId = getChatRoomId(sender.uid, receiverUid);
    final message = MessageModel(
      text: text,
      senderUid: sender.uid,
      senderEmail: sender.email!,
    );
    await _firestore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(message.toMap());
  }

  // Get messages stream
  Stream<List<MessageModel>> getMessages(String receiverUid) {
    final chatRoomId =
        getChatRoomId(_auth.currentUser!.uid, receiverUid);
    return _firestore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => MessageModel.fromMap(d.data())).toList());
  }
}