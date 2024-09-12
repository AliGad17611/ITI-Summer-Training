import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final pickedImage = await ImagePicker().pickImage(source: source);
  if (pickedImage != null) {
    return pickedImage.readAsBytes();
  }
  print('No image selected');
}