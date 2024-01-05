class MockAPI {
  static bool validate_Credentials(String user, String password) {
    if (user == "Target" && password == "Sistemas")
      return true;
    else
      return false;
  }
}
