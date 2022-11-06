const String identifier = 'mvc';
const String secret = 'secret';
final List<String> responseTypes = ['id_token', 'token'];
final List<String> scopes = ['openid', 'profile', 'api1', 'offline_access'];
final authorizationEndpoint =
    Uri.parse('https://infactouch.biscozum.com.tr/identity/connect/authorize');
final tokenEndpoint =
    Uri.parse('https://infactouch.biscozum.com.tr:443/identity/connect/token');
final redirectUrl = Uri.parse('tr.com.biscozum.infactdoruk://oauth2redirect');
