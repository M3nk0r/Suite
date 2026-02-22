
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AddShoppingListDialog extends StatelessWidget {
  AddShoppingListDialog({super.key});

  String value = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add shopping list '),
      content: TextFormField(
        decoration: InputDecoration(labelText: 'Name'),
        onChanged: (value) => this.value = value,
      ),
      actions: [
        TextButton(onPressed: (){
          context.router.pop(null);
        }, child: Text('Close')),
        TextButton(onPressed: (){
          context.router.pop(value);
        }, child: Text('Add')),
      ],
    );
  }
}
