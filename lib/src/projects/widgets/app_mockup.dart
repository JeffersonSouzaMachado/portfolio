import 'package:flutter/material.dart';
import 'package:portfolio/src/projects/widgets/section_header.dart';

class AppMockups extends StatelessWidget {
  const AppMockups({super.key, required this.appMockupsList, required this.headTitle, required this.icon});

  final List<String> appMockupsList;
  final String headTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...sectionHeader(title: headTitle, icon: icon),
        Row(
          children: appMockupsList.map((item) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 220,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.asset(item),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
