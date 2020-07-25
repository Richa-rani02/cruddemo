class Validation {

  String validateName(String text) {
    if(!text.contains(new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"))){
      return "Please enter a valid email ";
    }
    return null;
   /* return text
        .contains(new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"));*/
  }

  static bool validateNumber(String text) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

 static bool validateEmail(String text) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validatePassword(String text) {
    return text.toString().length >= 6;
  }
  /*String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'please enter a valid Email';
    } else if (value.length == 0) {
      return 'Required';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be more than 4 character';
    }
    return null;
  }*/
}
