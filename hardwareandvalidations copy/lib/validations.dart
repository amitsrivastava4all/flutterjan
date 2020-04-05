import 'package:flutter/material.dart';

class ValidationDemo extends StatefulWidget {
  @override
  _ValidationDemoState createState() => _ValidationDemoState();
}

class _ValidationDemoState extends State<ValidationDemo> {
  final _formKey = GlobalKey<FormState>();
  var _selectedCourse;
  var courses = ["Java", "C", "C++", "Flutter"];
  _submitForm(context) {
    if (_formKey.currentState.validate()) {
      print("Form is Correct");
    } else {
      print("Form is Not valid");
    }
  }

  loadCourses() {
    return courses.map((course) {
      return DropdownMenuItem<String>(value: course, child: Text(course));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation Demo'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Name Can't Be Blank";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 30, color: Colors.red),
                      hintText: 'Enter Your Name',
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField<String>(
                  value: _selectedCourse,
                  validator: (currentValue) {
                    if (currentValue == null) {
                      return 'Course Must be selected';
                    }
                    return null;
                  },
                  hint: Center(
                    child: Text('Select the Course'),
                  ),
                  isExpanded: true,
                  items: loadCourses(),
                  onChanged: (String value) {
                    setState(() {
                      _selectedCourse = value;
                    });

                    print("U Selected the Course $_selectedCourse");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                  onPressed: () {
                    _submitForm(context);
                  },
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
