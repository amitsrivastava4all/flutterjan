import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedGender = "Gender";
  String _name;
  String _selectedCourse;
  List<String> _selectedHobbies = List();

  List<String> courses = [
    'JAVA',
    'Node',
    'React',
    'Flutter',
    'MongoDB',
    'Redux'
  ];
  Map<String, bool> hobbies = {
    'Cricket': false,
    'Football': false,
    'Tenis': false,
    'Swimming': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Registration Form"),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter Your name";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _name = value;
                },
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  filled: true,
                  contentPadding:
                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              DropdownButtonFormField<String>(
                onChanged: (String val) {
                  setState(() {
                    _selectedCourse = val;
                  });
                },
                validator: (value) =>
                    value == null ? 'Course is required' : null,
                value: _selectedCourse,
//                underline: Container(
//                  height: 2,
//                  color: Colors.blue[200],
//                ),
                hint: Center(
                  child: Text(
                    "Select Course",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                isExpanded: true,
                items: courses.map((course) {
                  return DropdownMenuItem<String>(
                    value: course,
                    child: Text(
                      course,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select Hobbies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: hobbies.keys.map((String key) {
                    return ListTile(
                      leading: Checkbox(
                        value: hobbies[key],
                        onChanged: (bool val) {
                          if (val == true) {
                            setState(() {
                              hobbies[key] = val;
                              _selectedHobbies.add(key);
                            });
                          } else {
                            setState(() {
                              hobbies[key] = val;
                              _selectedHobbies.remove(key);
                            });
                          }
                        },
                      ),
                      title: Text(key),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: Row(
                  children: <Widget>[
                    Radio(
                      groupValue: _selectedGender,
                      value: "Male",
                      onChanged: (newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                    ),
                    Text("Male"),
                    Radio(
                      groupValue: _selectedGender,
                      value: "Female",
                      onChanged: (newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                    ),
                    Text("Female"),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.orange,
                onPressed: () {
                  _submitForm(context);
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submitForm(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_name);
      print(_selectedGender);
      print(_selectedHobbies);
      print(_selectedGender);
    }
  }
}
