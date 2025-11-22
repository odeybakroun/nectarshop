import 'package:flutter/material.dart';
import 'package:nectarshop/src/core/config/config.dart';
import 'package:nectarshop/src/core/utils/AppValidators.dart';
import 'package:nectarshop/src/features/users/domain/entities/register_entities.dart';
import 'package:nectarshop/src/features/users/domain/usecases/register_usecase.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController EmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  int convertage() {
    return int.parse(ageController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                // Email
                _buildInput(
                  label: "Username or Email",
                  controller: EmailController,
                  icon: Icons.person,
                  validator: (value) {
                  return AppValidators.email(value);
                  },
                ),

                const SizedBox(height: 15),

                // Password
                _buildInput(
                  label: "Password",
                  controller: passwordController,
                  icon: Icons.lock,
                  isPassword: true,
                  validator: (value) {
                                  return AppValidators.password(value);

                  },
                ),

                const SizedBox(height: 15),

                // First Name
                _buildInput(
                  label: "First Name",
                  controller: firstNameController,
                  icon: Icons.account_circle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "First name is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // Last Name
                _buildInput(
                  label: "Last Name",
                  controller: lastNameController,
                  icon: Icons.account_circle_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // Age
                _buildInput(
                  label: "Age",
                  controller: ageController,
                  icon: Icons.calendar_today,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Age is required";
                    }
                    if (int.tryParse(value) == null) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 35),

                // Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          var register = getit<RegisterUsecase>();
                          await register(
                            RegisterEntity(
                              email: EmailController.text,
                              password: passwordController.text,
                              firstname: firstNameController.text,
                              lastname: lastNameController.text,
                              age: convertage(),
                            ),
                          );

                          print(
                            """  
Account Created =>
Email: ${EmailController.text}
Password: ${passwordController.text}
First Name: ${firstNameController.text}
Last Name: ${lastNameController.text}
Age: ${convertage()}
""",
                          );
                        } catch (e) {
                          print("catch $e");
                        }
                      }
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom Input Widget
  Widget _buildInput({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
