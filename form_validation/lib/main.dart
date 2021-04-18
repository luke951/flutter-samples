import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  GlobalKey<FormState> _key = new GlobalKey();
  String _name;
  String _email;
  String _mobile;
  String _password;
  bool _validationError = false;
  bool _validationSuccess = false;

  String _validateName(String value) {
    String _pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(_pattern);
    if (value.length == 0) {
      return "Name is required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String _validateMobile(String value) {
    String _pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(_pattern);
    if (value.length == 0) {
      return "Mobile is required";
    } else if (value.length < 9) {
      return "Mobile min length is 9 digits";
    } else if (value.length > 12) {
      return "Mobile max length is 12 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile must be digits";
    }
    return null;
  }

  String _validateEmail(String value) {
    String _pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(_pattern);
    if (value.length == 0) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String _validatePassword(String value) {
    String _pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(_pattern);
    if (value.length == 0) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password should be at least 8 characters";
    } else if (!regExp.hasMatch(value)) {
      return "Provide a strong password: minimum 1 upper case, 1 lowercase, 1 numeric and 1 special character";
    } else {
      return null;
    }
  }

  void _submitForm() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      setState(() {
        _validationError = false;
      });
      setState(() {
        _validationSuccess = true;
      });
      print("Name: $_name");
      print("Mobile: $_mobile");
      print("Email: $_email");
      print("Password: $_password");
    } else {
      setState(() {
        _validationError = true;
      });
    }
  }

  void _resetForm() {
    setState(() {
      _validationSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form validation",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Form(
              key: _key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_validationError == true) ...[
                    SizedBox(
                      child: const DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Invalid form",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  backgroundColor: Colors.red,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                  if (_validationSuccess == true) ...[
                    SizedBox(
                      child: const DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                              BorderRadius.all(Radius.circular(4.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Validation succeeded",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  backgroundColor: Colors.green,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text(
                          'Reset form',
                          style:
                          TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4.0))),
                          backgroundColor: Colors.blue,
                          primary: Colors.black12,
                        ),
                        onPressed: _resetForm,
                      ),
                    ),
                  ] else ...[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Type a name',
                        icon: Icon(Icons.person),
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      maxLength: 32,
                      keyboardType: TextInputType.name,
                      validator: _validateName,
                      onChanged: (String val) {
                        setState(() {
                          _name = val.trim();
                        });
                      },
                      onSaved: (String val) {
                        setState(() {
                          _name = val.trim();
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        hintText: 'Type a mobile',
                        icon: Icon(Icons.phone),
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 12,
                      validator: _validateMobile,
                      onChanged: (String val) {
                        setState(() {
                          _mobile = val.trim();
                        });
                      },
                      onSaved: (String val) {
                        setState(() {
                          _mobile = val.trim();
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Type an Email',
                        icon: Icon(Icons.email),
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 32,
                      validator: _validateEmail,
                      onChanged: (String val) {
                        setState(() {
                          _email = val.trim();
                        });
                      },
                      onSaved: (String val) {
                        setState(() {
                          _email = val.trim();
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Type a password',
                        icon: Icon(Icons.security),
                        errorMaxLines: 3,
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      maxLength: 32,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      validator: _validatePassword,
                      onChanged: (String val) {
                        setState(() {
                          _password = val.trim();
                        });
                      },
                      onSaved: (String val) {
                        setState(() {
                          _password = val.trim();
                        });
                      },
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4.0))),
                          backgroundColor: Colors.blueAccent,
                          primary: Colors.black12,
                        ),
                        onPressed: _submitForm,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
