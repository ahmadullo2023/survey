import 'package:flutter/material.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

class PageView7 extends StatefulWidget {
  const PageView7({super.key});

  @override
  State<PageView7> createState() => _PageView7State();
}

class _PageView7State extends State<PageView7> {
  bool isChecked = false;


  Widget get cheekBoxCard => Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFE0E5E9),
        ),
        borderRadius: BorderRadius.circular(15.0)),
    child: ListTile(
      title: const Text('Option 1'),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text("Как вы оцениваете качество нашего сервиса?7",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            textAlign: TextAlign.center),
        const SizedBox(height: 10),
        SizedBox(
          height: 430,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return cheekBoxCard;
              }
          ),
        ),
      ],
    );
  }
}
