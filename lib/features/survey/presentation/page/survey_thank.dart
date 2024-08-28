import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SurveyThankPage extends StatefulWidget {
  const SurveyThankPage({super.key});

  @override
  State<SurveyThankPage> createState() => _SurveyThankPageState();
}

class _SurveyThankPageState extends State<SurveyThankPage> {


  ///   --- WIDGET ---

  Widget get greatWidget => ElevatedButton(
        onPressed: () {
          //Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(343, 44),
            backgroundColor: const Color(0xFF4489F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        child: const Text('Отлично', style: TextStyle(color: Colors.white)),
      );


  Widget get textThankYou => const Text(
    "Благодарим вас",
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
  );


  Widget get bottomText => const Text(
      "Ваши отзывы и советы помогают нам \nулучшаться и радовать вас наилучшими \nуслугами и сервисами",
      textAlign: TextAlign.center);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Spacer(),
            SvgPicture.asset("assets/icons/Frame2.svg"),
            textThankYou,
            const SizedBox(height: 10),
             bottomText,
            const SizedBox(height: 15),
            const Spacer(),
            greatWidget,
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
