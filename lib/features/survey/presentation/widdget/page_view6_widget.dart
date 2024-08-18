import 'package:flutter/material.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

class PageView6 extends StatefulWidget {
  const PageView6({super.key});

  @override
  State<PageView6> createState() => _PageView6State();
}

class _PageView6State extends State<PageView6> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xFFE0E5E9),
              ),
              borderRadius: BorderRadius.circular(15.0)),
          child: ListTile(
            title: const Text('Option 1'),
            trailing: Radio<int>(
              value: 1,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
