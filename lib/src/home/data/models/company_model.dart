// import 'package:portfolio/src/home/domain/entities/company_entity.dart';
//
// class CompanyModel {
//   const CompanyModel({
//     required this.id,
//     required this.createdAt,
//     required this.companyName,
//     required this.startDate,
//     this.endDate,
//     required this.isActual,
//     required this.activeUsers,
//     required this.appList,
//     required this.appImages,
//     required this.localization,
//   });
//
//   final String id;
//   final DateTime createdAt;
//   final String companyName;
//   final DateTime startDate;
//   final DateTime? endDate;
//   final bool isActual;
//   final int activeUsers;
//   final List<String> appList;
//   final List<String> appImages;
//   final String localization;
//
//   factory CompanyModel.fromJson(Map<String, dynamic> json) {
//     return CompanyModel(
//       id: json['id'],
//       createdAt: DateTime.parse(json['createdAt']),
//       companyName: json['companyName'],
//       startDate: DateTime.parse(json['startDate']),
//       endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
//       isActual: json['isActual'],
//       activeUsers: json['activeUsers'],
//       appList: (json['appList'] as List).cast<String>(),
//       appImages: (json['appImages'] as List).cast<String>(),
//       localization: json['localization'],
//     );
//   }
//
//   CompanyEntity toEntity() {
//     return CompanyEntity(
//       createdAt: createdAt,
//       id: id,
//       companyName: companyName,
//       startDate: startDate,
//       endDate: endDate,
//       isActual: isActual,
//       activeUsers: activeUsers,
//       appList: appList,
//       appImages: appImages,
//       localization: localization,
//     );
//   }
// }
