import 'package:flutter/material.dart';
import 'package:login_page/onbording_screen.dart'; // You should adjust the import path to match your actual file structure.

void main() {
  runApp(
    MaterialApp(
      home: RegistrationScreen(),
    ),
  );
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedCourse = 'B.Tech';
  String selectedBranch = 'Computer Science';
  String selectedYear = '1st';

  final List<String> courses = ['B.Tech', 'M.Tech', 'Diploma in Engg', 'BCA'];

  final Map<String, List<String>> branches = {
    'B.Tech': [
      'Computer Science',
      'Electronics',
      'Civil',
      'Mechanical',
      'Chemical Engineering',
      'Computer Engineering',
      'Aerospace Engineering',
      'Biomedical Engineering',
      'Environmental Engineering',
      'Industrial Engineering',
      'Materials Engineering',
      'Software Engineering',
      'Electronics Engineering',
      'Robotics Engineering',
      'Telecommunications Engineering',
      'Control Systems Engineering',
      'Petroleum Engineering',
      'Structural Engineering',
      'Biomechanical Engineering',
      'Automotive Engineering',
      'Power Engineering',
    ],
    'M.Tech': [
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
      'Computer Science',
      'Electronics',
      'Civil',
      'Mechanical',
      'Chemical Engineering',
      'Computer Engineering',
      'Aerospace Engineering',
      /* Add more branches here */
    ],
    'Diploma in Engg': [
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
      'Computer Science',
      'Electronics',
      'Civil',
      'Mechanical',
      'Chemical Engineering',
      'Computer Engineering',
      'Aerospace Engineering',
      /* Add more branches here */
    ],
    'BCA': [
      'Computer Engineering',

      /* Add more branches here */
    ],
  };

  final Map<String, List<String>> yearsForCourses = {
    'B.Tech': ['1st', '2nd', '3rd', '4th'],
    'M.Tech': ['1st', '2nd'],
    'Diploma in Engg': ['1st', '2nd', '3rd'],
    'BCA': ['1st', '2nd', '3rd'],
  };

  String name = '';
  String email = '';
  String password = '';
  String mobile = '';
  String passwordError = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.gif'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Registration Form
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Set the form key
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Name Input
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Name is required';
                      }
                      return null;
                    },

                  ),
                  const SizedBox(height: 12),

                  // Email Input
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Email is required';
                      }
                      return null;
                    },

                  ),
                  const SizedBox(height: 12),

                  // Password Input
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Password is required';
                      }
                      return null;
                    },

                  ),
                  Text(
                    passwordError,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Mobile Number Input
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        mobile = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Mobile Number (Optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Course Selection
                  Text(
                    'Course',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedCourse,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCourse = newValue!;
                        selectedBranch = branches[selectedCourse]![0];
                        selectedYear = yearsForCourses[selectedCourse]![0];
                      });
                    },
                    items: courses.map((String course) {
                      return DropdownMenuItem<String>(
                        value: course,
                        child: Text(course),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),

                  // Branch Selection
                  Text(
                    'Branch',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedBranch,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBranch = newValue!;
                      });
                    },
                    items: branches[selectedCourse]!.map((String branch) {
                      return DropdownMenuItem<String>(
                        value: branch,
                        child: Text(branch),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),

                  // Year Selection
                  Text(
                    'Year',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedYear,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedYear = newValue!;
                      });
                    },
                    items: yearsForCourses[selectedCourse]!.map((String year) {
                      return DropdownMenuItem<String>(
                        value: year,
                        child: Text(year),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Password validation
                        if (password.length < 6) {
                          setState(() {
                            passwordError = 'Password must be at least 6 characters';
                          });
                        } else {
                          passwordError = '';

                          // Your validation passed, proceed with the form submission
                          // Handle registration logic here
                          // You can access the form data like email, name, password, mobile, selectedCourse, selectedBranch, selectedYear

                          // After successful registration, navigate to the onboarding screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingScreen(),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}