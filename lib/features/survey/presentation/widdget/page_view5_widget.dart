import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

class PageView5 extends StatefulWidget {
  const PageView5({super.key});

  @override
  State<PageView5> createState() => _PageView5State();
}

class _PageView5State extends State<PageView5> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text("Что вы думаете о нашем сервисе и продуктах?5",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
             color: const Color(0xFFF5F6F7),
              height: 200,
             child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 TextField(
                   maxLines: 6,
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Введите свой ответ",
                    fillColor: Color(0xFFF5F6F7),
                    filled: true,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  maxLength: 100,
                   ),
               ],
             ),
                    ),
          ),
      ],
    );
  }
}
