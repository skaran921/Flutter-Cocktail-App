import 'package:http/http.dart' as http;
import 'dart:convert';

class CocktailProvider {
  var apiUrl =
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  Future getCoctailRecords() async {
    var response = await http.get(apiUrl);

    var jsonRespose = json.decode(response.body);
    // print(jsonRespose["drinks"]);
    return jsonRespose["drinks"];
  }
}
