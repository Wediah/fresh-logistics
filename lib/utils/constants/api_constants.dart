class ApiConstants {
  ApiConstants._();

  // Base URL
  static const String baseUrl = 'https://api.example.com';

  // Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String fetchDataEndpoint = '/data/fetch';

  // Timeouts - Updated names to match Dio's expected parameters
  static const Duration connectTimeout = Duration(seconds: 15);  // Renamed from connectionTimeout
  static const Duration receiveTimeout = Duration(seconds: 30);  // Renamed from requestTimeout

  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json', 
    'Accept': 'application/json',
  };
}