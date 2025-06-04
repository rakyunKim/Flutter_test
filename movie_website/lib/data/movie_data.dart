import 'dart:convert';
import 'package:movie_website/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieData {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNjUyOWE1NDc5NTIzNTExMGZhZGQ0MzE1YTg2MDBjOCIsIm5iZiI6MTc0ODMzOTc0NS42NzIsInN1YiI6IjY4MzU4YzIxNGNjYTQ1N2RmMTQxNGE5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GueQYVHnjXySRq1ke4lLKf-6rCsFBLLUB-49K6qCg4o';

  Future<List<MovieModel>> fetchTopRatedMovie() async {
    final response = await http.get(
      Uri.parse('$baseUrl/top_rated?language=ko&page=1&region=KR'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ((jsonDecode(response.body)['results']) as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load movie data");
    }
  }

    Future<List<MovieModel>> fetchNowPlayingMovie() async {
    final response = await http.get(
      Uri.parse('$baseUrl/now_playing?language=ko&page=1&region=KR'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ((jsonDecode(response.body)['results']) as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load movie data");
    }
  }

    Future<List<MovieModel>> fetchPopularMovie() async {
    final response = await http.get(
      Uri.parse('$baseUrl/popular?language=ko&page=1&region=KR'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ((jsonDecode(response.body)['results']) as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load movie data");
    }
  }
}
