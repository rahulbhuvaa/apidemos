// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:action_broadcast/action_broadcast.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketInit extends ChangeNotifier {
  static IO.Socket? socket;
  BuildContext? context;
  bool isEventSent = false;
  static bool isInitialized = false;
  SocketInit({required this.context});

  socketInit() async {

    if (!isInitialized) {
      debugPrint("😡🤬😡🥵🤬😡🥵😡🥵");
     int id =0;

      debugPrint("EVENT ID-=--->> ${id.toString()}");
      socket = IO.io(
       " ApiUtils.socketUrl",
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .enableReconnection() //  disableAutoConnect() disable auto-connection
            .setExtraHeaders({'foo': 'bar'})
            .enableForceNewConnection()
            .build(),
      );

      socket!.onConnect((data) {
        if (!isEventSent) {
          socket!.emit('live_users', {'event_id': id});
          isEventSent = true;
        }
        debugPrint("😃😃😃😃😃😃😃😃😃😃😃 Socket Connect Successfully! 😃😃😃😃😃😃😃😃😃😃😃");
      });
      debugPrint("socket.on ---------");
      socket!.connect();

      socket!.on(id.toString(), (data) {
        debugPrint("socket.on -----EVENT------ $data");

        SocketCommentResponse commentResponseSocket = SocketCommentResponse.fromJson(jsonDecode(jsonEncode(data)));
        sendBroadcast(BroadcastUtils.liveComment, extras: jsonDecode(jsonEncode(commentResponseSocket)));
        debugPrint('sendBroadCast --- ${commentResponseSocket.toJson().toString()}');
      });
      socket!.once(id.toString(), (data) {
        debugPrint('once ------EVENT CHECK----- $data');
      });
      isInitialized = true;
    }}

    Future disposeSocket() async {
      if (socket != null && socket!.connected) {
        socket!.disconnect();
        socket = null;
        isInitialized = false;
        debugPrint("😭😭😭😭😭😭😭😭😭😭😭😭😭😭 Socket Disconnect! 😭😭😭😭😭😭😭😭😭😭😭😭😭😭");
      }
    }
  }
class BroadcastUtils {
  static const String profileImageUpload = '';
  static const String updateProfileImageUpload = '';
  static const String liveComment = '';
}

// To parse this JSON data, do
//
//     final socketCommentResponse = socketCommentResponseFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators



SocketCommentResponse socketCommentResponseFromJson(String str) => SocketCommentResponse.fromJson(json.decode(str));

String socketCommentResponseToJson(SocketCommentResponse data) => json.encode(data.toJson());

class SocketCommentResponse {
  SocketCommentResponse({
    this.eventId,
    this.msg,
    this.username,
    this.avatar,
    this.noOfLive,
    this.type,
    this.sequenceNumber,
    this.questionType,
    this.optionName,
    this.totalQuestion,
    this.questionId,
    this.answerId,
    this.fileUrl,
    this.isPublish,
    this.question,
     this.option,
    this.answerCount,
    this.advertisementLink,
    this.canUseLive=0
  });

  String? eventId;
  String? msg;
  String? username;
  String? avatar;
  int? noOfLive;
  String? type;
  int? sequenceNumber;
  int? questionType;
  String? optionName;
  int? totalQuestion;
  int? questionId;
  int? answerId;
  String? fileUrl;
  int? isPublish;
  Question? question;
  List<Option>? option;
  List<AnswerCountResponse>? answerCount;
  String? advertisementLink;
  int? canUseLive;

  factory SocketCommentResponse.fromJson(Map<String, dynamic> json) => SocketCommentResponse(
        eventId: json["event_id"] == null ? null : (json["event_id"]).toString(),
        msg: json["msg"] == null ? null : json["msg"],
        username: json["username"] == null ? null : json["username"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        type: json["type"] == null ? null : json["type"],
        sequenceNumber: json["sequence_number"] == null ? null : json["sequence_number"],
        questionType: json["question_type"] == null ? null : json["question_type"],
        optionName: json["option_name"] == null ? null : json["option_name"],
        noOfLive: json["no_of_live"] == null ? null : json["no_of_live"],
        totalQuestion: json["total_question"] == null ? null : json["total_question"],
        questionId: json["question_id"] == null ? null : json["question_id"],
        answerId: json["answer_id"] == null ? null : json["answer_id"],
        fileUrl: json["file_URL"] == null ? null : json["file_URL"],
        isPublish: json["isPublish"] == null ? null : json["isPublish"],
        question: json["question"] == null ? null : Question.fromJson(json["question"]),
        option: json["option"] == null ? [] : List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
        advertisementLink: json["advertisement_link"] == null ? null : json["advertisement_link"],
        answerCount: json["answer_count"] == null ? null : List<AnswerCountResponse>.from(json["answer_count"].map((x) => AnswerCountResponse.fromJson(x))),
        canUseLive: json["can_use_lives"] == null ? null : json["can_use_lives"],
  );

  Map<String, dynamic> toJson() => {
        "event_id": eventId == null ? null : eventId,
        "msg": msg == null ? null : msg,
        "username": username == null ? null : username,
        "avatar": avatar == null ? null : avatar,
        "type": type == null ? null : type,
        "sequence_number": sequenceNumber == null ? null : sequenceNumber,
        "no_of_live": noOfLive == null ? null : noOfLive,
        "question_type": questionType == null ? null : questionType,
        "option_name": optionName == null ? null : optionName,
        "total_question": totalQuestion == null ? null : totalQuestion,
        "question_id": questionId == null ? null : questionId,
        "answer_id": answerId == null ? null : answerId,
        "file_URL": fileUrl == null ? null : fileUrl,
        "isPublish": isPublish == null ? null : isPublish,
        "question": question == null ? null : question!.toJson(),
        "option": option == null ? [] : List<dynamic>.from(option!.map((x) => x.toJson())),
        "answer_count": answerCount == null ? null : List<dynamic>.from(answerCount!.map((x) => x.toJson())),
        "advertisement_link": advertisementLink == null ? null : advertisementLink,
        "can_use_lives": canUseLive == null ? null : canUseLive,
      };
}

class AnswerCountResponse {
  AnswerCountResponse({
    this.id,
    this.name,
    this.questionId,
    this.isCorrect,
    this.createdAt,
    this.updatedAt,
    this.answerCount,
  });

  final int? id;
  final String? name;
  final int? questionId;
  final int? isCorrect;
  final String? createdAt;
  final String? updatedAt;
  final int? answerCount;

  factory AnswerCountResponse.fromJson(Map<String, dynamic> json) => AnswerCountResponse(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        questionId: json["question_id"] == null ? null : json["question_id"],
        isCorrect: json["is_correct"] == null ? null : json["is_correct"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        answerCount: json["answer_count"] == null ? null : json["answer_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "question_id": questionId == null ? null : questionId,
        "is_correct": isCorrect == null ? null : isCorrect,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "answer_count": answerCount == null ? null : answerCount,
      };
}

class Option {
  Option({
    this.id,
    this.option,
    this.optionResult = -2,
  });

  final int? id;
  final String? option;
  int? optionResult;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"] == null ? null : json["id"],
        option: json["option"] == null ? null : json["option"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "option": option == null ? null : option,
      };
}

class Question {
  Question({
    this.id,
    this.question,
    this.description,
  });

  final int? id;
  final String? question;
  final String? description;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"] == null ? null : json["id"],
        question: json["question"] == null ? null : json["question"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "question": question == null ? null : question,
        "description": description == null ? null : description,
      };
}
