import 'dart:async';
import 'dart:convert';

/// Simulates an API call to fetch user data.
class UserRemoteDataSource {
  Future<Map<String, dynamic>> fetchUserData() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulated JSON response for user data
    const jsonString = '''
    {
      "id": "123",
      "name": "Emmanuel Aguilar",
      "email": "emma.dev3a@gmail.com",
      "profileImageUrl": "https://media.licdn.com/dms/image/v2/D4E03AQF5Y30RHGS7Aw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1714405459443?e=1750291200&v=beta&t=koR0UWQeNRajsPAN6P4PD01iHguFvBOo_WRwtD_f3fY"
    }
    ''';

    // Parse and return the data as a Map
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}
