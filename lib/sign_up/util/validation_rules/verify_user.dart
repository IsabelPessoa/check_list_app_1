
String? verifyUser ({required String email, required String userEmail, required String password, required String userPassword}) {

  if(verifyEmail(email, userEmail) && verifyPassword(password, userPassword)){
    return null;
  }

  return 'Usuário e/ou senha não correspondente(s).';
}

bool verifyEmail (String email, String userEmail) {
  if (userEmail == email){
    return true;
  }
  return false;
}

bool verifyPassword (String password, String userPassword) {
  if (userPassword == password){
    return true;
  }
  return false;
}