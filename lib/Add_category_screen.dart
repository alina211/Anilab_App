import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCategoryScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  void addCategory() {
    FirebaseFirestore.instance.collection('categories').add({
      'name': _nameController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Category')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            ElevatedButton(
              onPressed: addCategory,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import '../Models/Category_models.dart';
// import '../Services/Firestore_services.dart';
//
// class AddCategoryScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final CategoryService _categoryService = CategoryService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Category'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Category Name'),
//                 validator: (value) =>
//                 value!.isEmpty ? 'Enter a category name' : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     final id = DateTime.now().millisecondsSinceEpoch.toString();
//                     final category = CategoryModel(id: id, name: _nameController.text);
//                     await _categoryService.addCategory(category);
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Add'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
