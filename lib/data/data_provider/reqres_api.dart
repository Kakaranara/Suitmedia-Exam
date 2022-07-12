import 'package:http/http.dart' as http;

class ReqResAPI {
  Future<String> getPeopleData({required int page}) async {
    final uri = "https://reqres.in/api/users?page=$page&per_page=10";

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return response.body;
    }

    print(response.body);
    throw Exception("Cannot fetch data");
  }
}
