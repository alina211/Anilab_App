import 'package:flutter/material.dart';
import '../Models/Category_models.dart';
import '../Services/Firestore_services.dart';

class EditCategoryScreen extends StatelessWidget {
  final CategoryModel category;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final CategoryService _categoryService = CategoryService();

  EditCategoryScreen({required this.category}) {
    _nameController.text = category.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Category Name'),
                validator: (value) =>
                value!.isEmpty ? 'Enter a category name' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final updatedCategory = CategoryModel(
                        id: category.id, name: _nameController.text);
                    await _categoryService.updateCategory(updatedCategory);
                    Navigator.pop(context);
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
