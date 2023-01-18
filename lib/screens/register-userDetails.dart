// import 'dart:io';

// import 'package:backendfinalproject/screens/constant/utils.dart';
// import 'package:backendfinalproject/screens/mainPage.dart';
// import 'package:backendfinalproject/services/getHome.dart';
// //import 'package:backendfinalproject/services/register_user.dart';
// import 'package:flutter/material.dart';
// import 'package:quickalert/quickalert.dart';

// import '../services/registerUseDetails.dart';

// class RegisterUser extends StatefulWidget {
//   const RegisterUser({super.key});

//   @override
//   State<RegisterUser> createState() => _RegisterUserState();
// }

// class _RegisterUserState extends State<RegisterUser> {
// List<File> images = [];

//   bool isObscurePassword = true;
//   void showAlert() {
//     QuickAlert.show(
//         context: context,
//         title: "Success",
//         text: "The person is Successful Registered",
//         type: QuickAlertType.success);
//   }

//    void selectImage() async {
//     var res = await pickImages();
//     setState(() {
//       images = res;
//     });
//   }

//   final TextEditingController _controller = TextEditingController();
//   Future<HomeContainer>? _futureAlbum;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registration'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(
//               context,
//               MainPage(),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.settings,
//               color: Colors.white,
//             ),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 15, top: 20, right: 15),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Center(
//                 child: Stack(children: [
//                   Container(
//                     width: 130,
//                     height: 130,
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 4, color: Colors.white),
//                         boxShadow: [
//                           BoxShadow(
//                               spreadRadius: 2,
//                               blurRadius: 10,
//                               color: Colors.black.withOpacity(0.1))
//                         ],
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                                 'https://media.istockphoto.com/id/1446693246/photo/businessman-using-smartphone-to-input-alphabet-in-searching-bar-for-search-engine.jpg?s=612x612&w=is&k=20&c=_AEW6T12l86YnsuokVVSZGwq9AfUPt60FeSCFCxyCkY='))),
//                   ),
//                   GestureDetector(
//                     onTap: selectImage,
//                     child: Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(width: 4, color: Colors.white),
//                               color: Colors.blue),
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           ),
//                         )),
//                   )
//                 ]),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               buildTextField("Names", "Igiraneza Divine", false),
//               buildTextField("Username", "Didi", false),
//               buildTextField("Gender", "Female", false),
//               buildTextField("Last Seen", "on Friday", false),
//               buildTextField("Details", "She is a Student", false),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text('Submitted By'),
//               const SizedBox(
//                 height: 30,
//               ),
//               buildTextField("Name", "Uwayo Kevine", false),
//               buildTextField("Email", "uwayokevine@gmail.com", false),
//               buildTextField("phone", "07863456678", false),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlinedButton(
//                     onPressed: () {},
//                     child: Text("Cancel",
//                         style: TextStyle(
//                             fontSize: 15,
//                             letterSpacing: 2,
//                             color: Colors.black)),
//                     style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20))),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _futureAlbum = createUserDetails(_controller.text, _controller.text, _controller.text, _controller.text, _controller.text, _controller.text, _controller.text, _controller.text, _controller.text);
//                       });
//                     },
//                     child: Text("Save",
//                         style: TextStyle(
//                             fontSize: 15,
//                             letterSpacing: 2,
//                             color: Colors.white)),
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20))),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(String labelText, String placeholder,
//       bool isPasswordTextField, String controller) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30),
//       child: TextField(
//         controller: TextEditingController(),
//         obscureText: isPasswordTextField ? isObscurePassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     icon: Icon(Icons.remove_red_eye, color: Colors.grey),
//                     onPressed: () {})
//                 : null,
//             contentPadding: EdgeInsets.only(bottom: 5),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             hintStyle: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
//       ),
//     );
//   }
// }

//   FutureBuilder<homeContainer> buildFutureBuilder() {
//     return FutureBuilder<homeContainer>(
//       future: _futureAlbum,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Text(snapshot.data!.photo);
//           Text(snapshot.data!.name);
//           Text(snapshot.data!.place);
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }

//         return const CircularProgressIndicator();
//       },
//     );
//   }

