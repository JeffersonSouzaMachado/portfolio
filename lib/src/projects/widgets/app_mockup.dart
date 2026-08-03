import 'package:flutter/material.dart';
import 'package:portfolio/src/projects/widgets/section_header.dart';

class AppMockups extends StatelessWidget {
  const AppMockups({
    super.key,
    required this.appMockupsList,
    required this.headTitle,
    required this.icon,
  });

  final List<String> appMockupsList;
  final String headTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...sectionHeader(title: headTitle, icon: icon),
        SizedBox(
          height: 390,
          child: ListView.builder(

            scrollDirection: Axis.horizontal,
            itemCount: appMockupsList.length,
            itemBuilder: (context, index) {
              final item = appMockupsList[index];

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
            },
          ),
        ),
      ],
    );
  }
}
