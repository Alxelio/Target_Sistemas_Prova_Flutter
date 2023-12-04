class MockAPI {
  static Future<bool> validate_Credentials(String user, String password) async {
    await Future.delayed(
      Duration(milliseconds: 300),
    );

    if (user == "Target" && password == "Sistemas")
      return true;
    else
      return false;
  }
}


