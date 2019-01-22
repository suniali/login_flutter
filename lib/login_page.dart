import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  final TextEditingController textEditingController_email =
      TextEditingController();
  final TextEditingController textEditingController_password =
      TextEditingController();

  void _handleSubmit(String email, String password) {
    textEditingController_email.clear();
    textEditingController_password.clear();
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/man.jpg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            SingleChildScrollView(
                          child: Container(
                padding: EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(
                      size: _iconAnimation.value * 100,
                    ),
                    Form(
                      child: Theme(
                        data: ThemeData(
                            accentColor: Colors.lightBlueAccent,
                            inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(color: Colors.grey),
                            )),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: textEditingController_email,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0
                              ),
                              decoration:
                                  InputDecoration(labelText: "Enter Email"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: textEditingController_password,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0
                              ),
                              decoration:
                                  InputDecoration(labelText: "Enter Password"),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: MaterialButton(
                                color: Colors.lightBlue,
                                textColor: Colors.white70,
                                minWidth: 60.0,
                                child: Text("Login"),
                                splashColor: Colors.indigo,
                                onPressed: () {
                                  _handleSubmit(textEditingController_email.text,
                                      textEditingController_password.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
