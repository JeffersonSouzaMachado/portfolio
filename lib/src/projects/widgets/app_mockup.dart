import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/src/projects/widgets/section_header.dart';

class AppMockups extends StatelessWidget {
  const AppMockups({super.key, required this.appMockupsList});

  final List<String> appMockupsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...sectionHeader(title: 'Imagens do Projeto', icon: LucideIcons.images),
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
