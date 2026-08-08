import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/mappers/project_asset_mapper.dart';
import 'section_header.dart';

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
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
              },
            ),
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
                      child: Image.asset(ProjectAssetMapper.image(item)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
