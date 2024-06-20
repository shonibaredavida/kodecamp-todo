import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.requiredIcon,
    required this.cardTitle,
    required this.cardValue,
  });

  final Icon requiredIcon;
  final String cardTitle;
  final String cardValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 40, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 231, 218, 210),
                  child: requiredIcon),
              const SizedBox(
                height: 30,
              ),
              Text(
                cardTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cardValue,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
