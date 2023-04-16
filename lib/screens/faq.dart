import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/colors.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: textTheme.titleLarge!.copyWith(
              fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: ListView(
        children: [
          FaqItem(
            question: 'What is your return policy?',
            answer: 'Our return policy is...',
          ),
          FaqItem(
            question: 'What are the process for fragile items?',
            answer:
                'There are different steps before we shift the fragile items. We sign a paper with you which explains all the benefits and risks. So you can decide what to do with those items',
          ),
          FaqItem(
            question: 'How do I track my order?',
            answer: 'You can track your order by...',
          ),
          FaqItem(
            question: 'What payment methods do you accept?',
            answer: 'We accept...',
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.question,
        style: TextStyle(fontSize: 16),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            widget.answer,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
