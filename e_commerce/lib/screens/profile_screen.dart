import 'package:e_commerce/constants.dart';
import 'package:e_commerce/helper/get_user_information.dart';
import 'package:e_commerce/helper/shared_prefrence.dart';
import 'package:e_commerce/helper/show_snackbar.dart';
import 'package:e_commerce/helper/update_user_information.dart';
import 'package:e_commerce/screens/drawer_screen.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_email_field.dart';
import 'package:e_commerce/widgets/custom_number_field.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  // Uint8List? _image;
  final _formKey = GlobalKey<FormState>();
  String? userId;

  @override
  void initState() {
    super.initState();
    _getUserInformation();
  }

  Future<void> _getUserInformation() async {
    userId = await getUserId();
    if (userId == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return;
    }

    final name = await getUserName(userId!);
    final email = await getUserEmail(userId!);
    final phone = await getUserPhone(userId!);
    final address = await getUserAddress(userId!);

    setState(() {
      nameController.text = name;
      emailController.text = email;
      phoneController.text = phone;
      addressController.text = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: CustomAppBar(title: 'Profile'),
        ),
        drawer: const DrawerScreen(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // _image != null
                      //     ? CircleAvatar(
                      //         radius: 100,
                      //         backgroundImage: MemoryImage(_image!)):
                      const CircleAvatar(
                          radius: 100,
                          backgroundImage: kDefaultProfileImageUrl),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: nameController,
                    labelText: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomEmailField(
                    emailController: emailController,
                    enabled: false,
                  ),
                  const SizedBox(height: 20),
                  CustomNumberField(
                    controller: phoneController,
                    labelText: 'Phone',
                    enabled: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: addressController,
                    labelText: 'Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: 'Save',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (userId != null) {
                          updateUsername(userId!, nameController.text);
                          updateUserAddress(userId!, addressController.text);
                          showSnackBar(context, 'Saved successfully!');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
