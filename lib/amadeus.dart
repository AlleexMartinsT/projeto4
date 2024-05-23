// importe as dependências
import 'dart:convert';
import 'package:http/http.dart';

class Amadeus {
  String? token;

  // Credenciaiss
  final String clientId = 'J3fDHUv36Fzv4XcnSCROOJYvLLnmoVj5';
  final String clientSecret = 'Gs7O9Wai4gfujGd8';

  Future<String?> generateAccessToken() async {
    // Endpoint de autorização do Amadeus
    Uri authorizationUri =
        Uri.parse("https://test.api.amadeus.com/v1/security/oauth2/token");
    Response response;

    // enviar solicitação de autorização
    try {
      response = await post(
        authorizationUri,
        headers: {"Content-type": "application/x-www-form-urlencoded"},
        body:
            "grant_type=client_credentials&client_id=$clientId&client_secret=$clientSecret",
      );

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        // obter token da resposta
        token = data['access_token'];
        return token;
      } else {
        print("Falha ao obter token: ${response.statusCode} ${response.body}");
        return null;
      }
    } catch (e) {
      print("erro ao gerar token --> $e");
      return "Não foi possível gerar o token de acesso devido ao erro $e";
    }
  }

  void getHotelOffers() async {
    // verificar se há um token existente antes de atribuir o valor à variável.
    String? accessToken = token == null ? await generateAccessToken() : token;
    if (accessToken == null) {
      print("Não foi possível obter o token de acesso.");
      return;
    }

    Uri uri = Uri.parse(
        "https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=HLLON101&adults=1");
    Response response;

    // enviar solicitação de autorização
    try {
      response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
      } else {
        print(
            "Falha ao obter ofertas de hotéis: ${response.statusCode} ${response.body}");
      }
    } catch (e) {
      print("erro $e ocorreu");
    }
  }
}
