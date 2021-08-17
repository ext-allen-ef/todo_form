// import 'package:flutter/material.dart';
// import 'package:sandbox/todo/bloc.dart';
// import 'package:sandbox/todo/event.dart';
// import 'package:sandbox/todo/model.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class TodoForm extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final Todo todo;
//   void Function(Todo updatedTodo) onSubmission;
//
//   TodoForm({Key? key, required this.todo, required this.onSubmission})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           TextFormField(
//             initialValue: todo.name,
//             decoration: InputDecoration(labelText: 'Todo'),
//             onSaved: (value) {
//               this.onSubmission(todo.copyWith(name: value!));
//             },
//             onFieldSubmitted: (value) {
//               final valid = _formKey.currentState!.validate();
//               if (valid) {
//                 _formKey.currentState?.save();
//                 Navigator.of(context).pop();
//               }
//             },
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return "Please enter a name!";
//               }
//               return null;
//             },
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 final valid = _formKey.currentState!.validate();
//                 if (valid) {
//                   _formKey.currentState?.save();
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: todo.name.isNotEmpty ? Text('Save') : Text('Create'))
//         ],
//       ),
//     );
//   }
// }
