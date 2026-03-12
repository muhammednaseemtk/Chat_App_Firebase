import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String text;
  final String senderUid;
  final String senderEmail;
  final DateTime? timestamp;

  MessageModel({
    required this.text,
    required this.senderUid,
    required this.senderEmail,
    this.timestamp,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      text: map['text'] ?? '',
      senderUid: map['senderUid'] ?? '',
      senderEmail: map['senderEmail'] ?? '',
      timestamp: (map['timestamp'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
    'text': text,
    'senderUid': senderUid,
    'senderEmail': senderEmail,
    'timestamp': FieldValue.serverTimestamp(),
  };
}