/* Services - Authentication Services */
class MockAPI{
  static Future<bool> validate_Credentials(String usuario, String senha) async {
    await Future.delayed(Duration(milliseconds: 300),);

    if( usuario == "Target" && senha == "Sistemas") return true;
    else return false;
  }
} /* Services - Authentication Services */