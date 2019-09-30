
import 'package:flutter/material.dart';
import 'authentication.dart';

class LoginSignUp extends StatefulWidget{

  final Map params;
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  LoginSignUp({this.params, this.auth, this.onSignedIn});

  @override
  State<StatefulWidget> createState() => LoginSignUpState();
}

enum FormMode{
  LOGIN,
  SIGN_UP,
  FORGOT_PASSWORD,

}

class LoginSignUpState extends State<LoginSignUp>{

  final formKey = new GlobalKey<FormState>();

  String email;
  String password;
  String errorMessage;

  // Initial form is login form
  FormMode formMode = FormMode.LOGIN;
  bool isIos;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    errorMessage = "";
    isLoading = false;
  }
  void changeFormToSignUp(){
    formKey.currentState.reset();
    errorMessage = "";
    setState(() {
      formMode = FormMode.SIGN_UP;
    });
  }

  void changeFormToLogin() {
    formKey.currentState.reset();
    errorMessage = "";
    setState(() {
      formMode = FormMode.LOGIN;
    });
  }

  void changeFormToPasswordReset() {
    formKey.currentState.reset();
    errorMessage = "";
    setState(() {
      formMode = FormMode.FORGOT_PASSWORD;
    });
  }

  // Check if form is valid before perform login or sign_up
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or sign_up
  void validateAndSubmit() async {
    setState(() {
      errorMessage = "";
      isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(email, password);
        } else if (formMode == FormMode.SIGN_UP) {
          userId = await widget.auth.signUp(email, password);
          widget.auth.sendEmailVerification();
          showVerifyEmailSentDialog();
        } else {
          widget.auth.sendPasswordReset(email);
          showPasswordEmailSentDialog();
        }
        setState(() {
          isLoading = false;
        });

        if (userId.length > 0 &&
            userId != null &&
            formMode == FormMode.LOGIN) {
          widget.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          isLoading = false;
          isIos ? errorMessage = e.details : errorMessage = e.message;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.params['appName']),
      ),
      body: Stack(
        children: <Widget>[
          showBody(),
          showCircularProgress(),
        ],
      ),
    );
  }

  //  WIDGETS

  Widget showCircularProgress() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('images/logo1.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    if (formMode != FormMode.FORGOT_PASSWORD) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Password',
              icon: new Icon(
                Icons.lock,
                color: Colors.grey,
              )),
          validator: (value) =>
          value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => password = value.trim(),
        ),
      );
    } else {
      return new Text('An email will be sent allowing you to reset your password',
          style:
          new TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300));
    }
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            color: widget.params['buttonColor'],
            child: textPrimaryButton(),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget textPrimaryButton() {
    switch (formMode) {
      case FormMode.LOGIN:
        return new Text('Login',
            style: new TextStyle(fontSize: 20.0, color: Colors.white));
        break;
      case FormMode.SIGN_UP:
        return new Text('Create account',
            style: new TextStyle(fontSize: 20.0, color: Colors.white));
        break;
      case FormMode.FORGOT_PASSWORD:
        return new Text('Reset password',
            style: new TextStyle(fontSize: 20.0, color: Colors.white));
        break;
    }
    return new Spacer();
  }
  Widget showSecondaryButton() {
    return new FlatButton(
      child: textSecondaryButton(),
      onPressed: formMode == FormMode.LOGIN
          ? changeFormToSignUp
          : changeFormToLogin,
    );
  }
  Widget textSecondaryButton() {
    switch (formMode) {
      case FormMode.LOGIN:
        return new Text('Create an account',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.SIGN_UP:
        return new Text('Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.FORGOT_PASSWORD:
        return new Text('Enter your email address or ... Cancel',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
    }
    return new Spacer();
  }
  Widget showForgotPasswordButton() {
    return new FlatButton(
      child: formMode == FormMode.LOGIN
          ? new Text('Forgot password?',
          style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300))
          : new Text('',
          style:
          new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300)),
      onPressed: changeFormToPasswordReset,
    );
  }

  Widget showErrorMessage() {
    if (errorMessage.length > 0 && errorMessage != null) {
      return new Text(
        errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
  void showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
          new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void showPasswordEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Forgot your password"),
          content: new Text("An email has been sent to reset your password"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Widget showBody() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
            showForgotPasswordButton(),
            showErrorMessage(),
          ],
        ),
      )
    );
  }

}