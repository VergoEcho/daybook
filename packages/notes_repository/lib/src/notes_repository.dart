import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:notes_repository/src/models/models.dart';

class NotesRepository {
  static Future<List<Note>> fetchNotes(int start, int limit) async {
    try {
      var response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts',
        queryParameters: {
          '_start': start,
          '_limit': limit,
        },
      );
      print('code ${response.statusCode}');
      if (response.statusCode == 200) {
        final body = response.data as List;
        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return Note(
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String,
          );
        }).toList();
      }
      return [];
    } catch (err) {
      print('Error: $err');
      return <Note>[];
    }
  }
}
