import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/survey_bloc.dart';

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
              height: 200,
               color: const Color(0xFFF5F6F7),
             child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 TextField(
                   maxLines: 6,
                  controller: textController,
                  onTap: () => context.read<SurveyBloc>().add(IsSelect(isSelect: textController.text.isNotEmpty ? false : true)),
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
