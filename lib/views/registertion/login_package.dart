import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:seere/utils/login_helper.dart';
import 'package:seere/views/nav_container.dart';
import 'package:seere/views/registertion/apiData.dart';
import 'package:seere/views/registertion/storeToken.dart';

const users = {
  'shereengalal60@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);
  Future<String?> _authUser(LoginData data) async {
    String username = data.name;
    String password = data.password;

    try {
      final response = await ApiService().loginUser(username, password, true);
      if (response.statusCode == 200) {
        final String token = response.data['token'];

        await setAccessToken(token);
        debugPrint("----------token: $token --------------");
        return null;
      } else {
        return 'User does not exist';
      }
    } catch (err) {      
      return 'Try again';
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    String? email = data.name;
    String? password = data.password;

    String? confirmPassword = data.additionalSignupData?['confirmPassword'];
    String? username = data.additionalSignupData?['Name'];
    //String? surname = data.additionalSignupData?['Surname'] ?? "Default";
    // Validation (implement before calling this function)
    if (email!.isEmpty || !email.contains('@')) {
      return 'Invalid email format';
    } else if (password!.isEmpty || password.length < 6) {
      return 'Password must be at least 6 characters long';
    } //else if (password != confirmPassword) {
    // return 'Passwords do not match';
    //}
    try {
      final response =
          await ApiService().signupUser(email, password, password, username!);
      if (response.statusCode == 200) {
        print(confirmPassword);
        print('///////////////////');

        return null;
      }
    } catch (err) {
      print(confirmPassword);
      print('////////////////////////////');
      return 'Try again';
    }
    return null;
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return _recoverPassword(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      //title: 'SeerE',
      logo: const AssetImage('assets/images/signin.png'),
      loginAfterSignUp: true,
      onLogin: _authUser,
      onSignup: _signupUser,

      additionalSignupFields: const [
        UserFormField(keyName: 'Name'),
      ],
      onSubmitAnimationCompleted: () {
        Helper.saveUserLoggedInSharedPreference(true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const NavContainer(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
