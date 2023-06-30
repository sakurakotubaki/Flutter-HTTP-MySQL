import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mysql_api/model/post_model.dart';

class AnimalRepository {
  // GET
  Future<List<Animal>> fetchAnimals() async {
    final response = await http.get(Uri.parse('http://localhost:3001/animals'));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => Animal.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load animals');
    }
  }
  // POST
  Future<Animal> postAnimal(String name) async {
    final response = await http.post(
      Uri.parse('http://localhost:3001/animals'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return Animal.fromJson(responseBody);
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to post animal');
    }
  }
}
