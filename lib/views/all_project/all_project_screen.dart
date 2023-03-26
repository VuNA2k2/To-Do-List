import 'package:flutter/material.dart';
import 'package:todo_list/views/widgets/project_item.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        return ProjectItem();
      },
      itemCount: 5,
    );
  }
}
