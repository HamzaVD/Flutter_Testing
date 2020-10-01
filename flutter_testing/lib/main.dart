import 'package:flutter/material.dart';
import 'package:flutter_testing/models/favorites.dart';
import 'package:flutter_testing/screens/favorites.dart';
import 'package:flutter_testing/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestingApp(),
    );
  }
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                validator: EmailFieldValidator.validate,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email', hintText: 'Enter Email Address'),
              ),
              TextFormField(
                controller: _passwordController,
                validator: PasswordFieldValidator.validate,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                      icon:
                          _isObscure ? Icon(Icons.lock) : Icon(Icons.lock_open),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Login', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
              Text(
                "CREATE ACCOUNT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}
