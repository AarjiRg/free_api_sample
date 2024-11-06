import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextField(
                controller: _nameController,
                label: "Name",
                hintText: "Enter your name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _phoneController,
                label: "Phone",
                hintText: "Enter your phone number",
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone is required";
                  }
                  if (value.length != 10) {
                    return "Enter a valid 10-digit phone number";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _placeController,
                label: "Place",
                hintText: "Enter your place",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Place is required";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _pincodeController,
                label: "Pincode",
                hintText: "Enter your pincode",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pincode is required";
                  }
                  if (value.length != 6) {
                    return "Enter a valid 6-digit pincode";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _emailController,
                label: "Email",
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _passwordController,
                label: "Password",
                hintText: "Enter your password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0), backgroundColor: Colors.teal,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the registration
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration Successful')),
                    );
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _placeController.dispose();
    _pincodeController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
