import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:notes_repository/src/models/models.dart';

class UserRepository {
  Future<List<Note>> fetchNotes(int start, int limit) async {
    var dio = Dio();
    var response = await dio.get(
      'jsonplaceholder.typicode.com/posts',
      queryParameters: {
        '_start': start,
        '_limit': limit,
      },
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.data) as List;
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
  }
}
