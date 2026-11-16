// import 'package:flutter/material.dart';
// import 'dashboard_screen.dart'; // ✅ Required for navigation
// import 'package:flutter/services.dart'; // For input formatters
//
// class FormScreen extends StatefulWidget {
//   @override
//   _FormScreenState createState() => _FormScreenState();
// }
//
// class _FormScreenState extends State<FormScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _birthdateController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _emailController = TextEditingController();
//
//   String? _selectedGender;
//   DateTime? _selectedDate;
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _birthdateController.dispose();
//     _ageController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
//
//   // Date picker function with year limit
//   Future<void> _selectBirthdate(BuildContext context) async {
//     final DateTime firstDate = DateTime(1965, 1, 1);
//     final DateTime lastDate = DateTime(2007, 12, 31);
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime(1986, 1, 1),
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//         _birthdateController.text = "${picked.day}/${picked.month}/${picked.year}";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User Info Form')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // Name - allow only alphabets & spaces, no numbers
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
//                 ],
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),
//
//               // Phone - only digits, max 10 digits, no alphabets
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   LengthLimitingTextInputFormatter(10),
//                 ],
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your phone number';
//                   }
//                   if (value.length != 10) {
//                     return 'Phone number must be exactly 10 digits';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),
//
//               // Birthdate - only between 1965 and 2007, using date picker
//               TextFormField(
//                 controller: _birthdateController,
//                 decoration: InputDecoration(
//                   labelText: 'Birthdate',
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 readOnly: true,
//                 onTap: () => _selectBirthdate(context),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your birthdate';
//                   }
//                   // Check selected date range explicitly
//                   if (_selectedDate == null) {
//                     return 'Please select a valid birthdate';
//                   }
//                   final year = _selectedDate!.year;
//                   if (year < 1965 || year > 2007) {
//                     return 'Birthdate must be between 1965 and 2007';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),
//
//               // Age - just a valid number
//               TextFormField(
//                 controller: _ageController,
//                 decoration: InputDecoration(
//                   labelText: 'Age',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   LengthLimitingTextInputFormatter(3),
//                 ],
//                 validator: (value) {
//                   if (value == null || value.isEmpty || int.tryParse(value) == null) {
//                     return 'Please enter a valid age';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),
//
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Gender',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedGender,
//                 items: ['Male', 'Female', 'Other']
//                     .map((gender) => DropdownMenuItem(
//                   value: gender,
//                   child: Text(gender),
//                 ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your gender';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),
//
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null ||
//                       value.isEmpty ||
//                       !value.contains('@') ||
//                       !value.contains('.')) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 25),
//
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
//                 child: Text('Submit'),
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DashboardScreen(),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormScreen extends StatefulWidget {
  final Function(Map<String, String>) onSubmit; // ✅ Callback to send data

  FormScreen({required this.onSubmit});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();

  String? _selectedGender;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _birthdateController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthdate(BuildContext context) async {
    final DateTime firstDate = DateTime(1965, 1, 1);
    final DateTime lastDate = DateTime(2007, 12, 31);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(1986, 1, 1),
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _birthdateController.text =
        "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Info Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your phone number';
                  if (value.length != 10) return 'Phone number must be exactly 10 digits';
                  return null;
                },
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _birthdateController,
                decoration: InputDecoration(
                  labelText: 'Birthdate',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectBirthdate(context),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please select your birthdate' : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter a valid age' : null,
              ),
              SizedBox(height: 15),

              // Gender - radio buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text("Male"),
                          value: "Male",
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text("Female"),
                          value: "Female",
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text("Other"),
                          value: "Other",
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  if (_selectedGender == null)
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                      child: Text(
                        "Please select your gender",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  SizedBox(height: 15),
                ],
              ),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                value == null || !value.contains('@') ? 'Please enter a valid email' : null,
              ),
              SizedBox(height: 25),

              // ✅ Submit & Reset buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // reset button color
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('Reset'),
                      onPressed: () {
                        setState(() {
                          _formKey.currentState?.reset(); // reset validators
                          _nameController.clear();
                          _phoneController.clear();
                          _birthdateController.clear();
                          _ageController.clear();
                          _emailController.clear();
                          _selectedGender = null; // clear gender selection
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate() && _selectedGender != null) {
                          widget.onSubmit({
                            'name': _nameController.text,
                            'phone': _phoneController.text,
                            'birthdate': _birthdateController.text,
                            'age': _ageController.text,
                            'gender': _selectedGender ?? '',
                            'email': _emailController.text,
                          });
                          Navigator.pop(context); // ✅ Go back to Dashboard
                        } else if (_selectedGender == null) {
                          // show error message for gender
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select your gender')),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
