// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:structure_project/Api/exception/no_internet_exception.dart';
import 'package:structure_project/Api/exception/success_result.dart';
import 'package:structure_project/Pref/share_prefrence.dart';

enum ApiType { get, post, put, delete, multipart }

class Api {
  Future<dynamic> httpApi({
    required BuildContext context,
    required ApiType apiType,
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? bodyData,
    Map<String, String>? maltiPartBodyData,
    String? imageUrl,
    String? imageKey,
    List<String?>? listFiles,
    bool isMultiImage = false,
  }) async {
    String token = PreferenceUtils.getStringValue( KeyUtils.keyUserToken) ;

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    int? statusCode;
    String paramsString = "";
    String streamResponse = "";
    if (parameters != null || paramsString.isNotEmpty) {
      List<String> listKeys = [];
      List<String> listValues = [];
      parameters!.forEach((key, value) {
        listKeys.add(key);
        listValues.add(value);
      });

      for (var i = 0; i < listKeys.length; i++) {
        if (i == 0) {
          paramsString = "$paramsString?";
        }
        paramsString = "$paramsString${listKeys[i]}=${listValues[i]}";
        if (i != listKeys.length - 1) {
          paramsString = "$paramsString&";
        }
      }
    }
    // String token = PreferenceUtils.getStringValue(key: keyUserToken) ?? '';

    http.Response? response;
    var connectivityResult = await (Connectivity().checkConnectivity());

    debugPrint('=============================================================');
    debugPrint('Connectivity ==>> $connectivityResult');
    debugPrint('ApiType ==>> $apiType');
    debugPrint('URL PARAMETERS ==>> $url$paramsString');
    debugPrint('PARAMETERS ==>> $parameters');

    debugPrint('BODYDATA ==>> $bodyData');
    debugPrint('maltiPartBodyData ==>> $maltiPartBodyData');
    debugPrint('ImageURL ==>> $imageUrl');
    debugPrint('LIST FILES ==>> $listFiles');
    debugPrint('headers ==>> $headers');
    debugPrint('=============================================================');

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      if (apiType == ApiType.get) {
        await http
            .get(
          Uri.parse(url + paramsString),
          headers: headers,
        )
            .then((res) {
          debugPrint('STATUS CODE GET------- ${res.body}');
          statusCode = res.statusCode;
          debugPrint('STATUS CODE GET------- $statusCode');

          response = res;
        }).catchError((e) {
          print(e);
          print(".........Error......");
          statusCode = 500;
        });
        // updateCookie(response);
      } else if (apiType == ApiType.post) {
        await http
            .post(
          Uri.parse(url + paramsString),
          body: jsonEncode(bodyData),
          headers: headers,
        )
            .then((res) {
          statusCode = res.statusCode;
          debugPrint('STATUS CODE POST------- $statusCode');
          debugPrint('STATUS BODY POST------- ${res.body}');
          response = res;
          // debugPrint(response!.body);
        }).catchError((e) {
          debugPrint('ERROR ------- $e');

          statusCode = 500;
        });
        // updateCookie(response);
      } else if (apiType == ApiType.multipart) {
        debugPrint('ApiType.multipart------- ApiType.multipart');

        try {
          var request = MultipartRequest(
            'POST',
            Uri.parse(url),
          );
          if (maltiPartBodyData != null) {
            request.fields.addAll(maltiPartBodyData);
          }
          if (isMultiImage == true) {
            // List<http.MultipartFile> newList = [];
            // for (var img in listFiles!) {
            //   if (img != "") {
            //     MultipartFile multipartFile = await http.MultipartFile.fromPath(
            //       imageKey!,
            //       File(img!).path,
            //       filename: img.split('/').last,
            //     );
            //     newList.add(multipartFile);
            //   }
            // }
            // print("_+_+_+_+_+_+_+_+_${newList.length}");
            // print("_+_+_+_+_+_+_+_+_${isMultiImage == true}");
            // request.files.addAll(newList);
            List<MultipartFile> newList = [];
            for (int i = 0; i < listFiles!.length; i++) {
              File imageFile = File(listFiles[i].toString());
              var stream = http.ByteStream(imageFile.openRead());
              var length = await imageFile.length();
              var multipartFile = http.MultipartFile(
                // "policy_document[$i]",
                "document_name[$i]",
                stream,
                length,
                filename: imageFile.path,
              );
              newList.add(multipartFile);
            }
            if(newList.isNotEmpty){
              print('New list --> ${newList[0].filename}');
            }
            request.files.addAll(newList);
          } else {
            if (imageUrl != null) {
              request.files.add(await http.MultipartFile.fromPath(imageKey!, imageUrl));
            }
          }
          request.headers.addAll(headers);
          var res = await request.send();
          statusCode = res.statusCode;
          streamResponse = await res.stream.bytesToString();
          debugPrint('STATUS CODE POST------- $statusCode');
          debugPrint('STATUS CODE POST------- $streamResponse');
        } catch (e) {
          statusCode = 500;
        }
      }

      debugPrint('STATUS CODE POST------- $statusCode');
      switch (statusCode) {
        case 200:
        case 201:
          if (apiType == ApiType.get || apiType == ApiType.post) {
            final dynamic body = response!.body;
            return body;
          } else if (apiType == ApiType.multipart) {
            dynamic body = streamResponse;

            return body;
          }
          break;
        case 401:
        case 404:
        case 500:
          // Fluttertoast.showToast(msg: "Session expired, please login again");
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AgentCodeScreen(),));
          break;

        case 303:
        default:
          final dynamic body = response!.body;
          return body;

        // return NoDataFoundException();
      }
    } else {
      NoInternetException().showNoNetworkWidget(
          context: context,
          onCancelTap: () {
            Navigator.pop(context);
          },
          onRetryTap: () {
            Navigator.pop(context);
            httpApi(
              context: context,
              url: url,
              apiType: apiType,
              bodyData: bodyData,
              parameters: parameters,
            );
          });
      return SuccessResultException();
    }
  }

  // void updateCookie(http.Response response) {
  //   String? rawCookie = response.headers['set-cookie'];
  //   if (rawCookie != null) {
  //     StorageUtils.setStringValue(key: cookieToken, value: rawCookie);
  //     // int index = rawCookie.indexOf(';');
  //     // headers['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);

  //   }
  //   print('=========check cookie================|$rawCookie');
  // }
}
class KeyUtils {
static String keyUserToken = 'user_token';
static String cookieToken = 'user_cookie_token';
  static String isRoute = 'Nothing';
  static String login = 'login';
  static String userEmail = 'UserEmail';
  static String userResponse = 'UserResponse';
  static String eventResponse = 'EventResponse';
  static String userProfileImage = 'UserProfileImage';
  static String quizRemainTime = 'QuizRemainTime';
  // static String isLoginSecondTime = 'isLoginSecondTime';
}
