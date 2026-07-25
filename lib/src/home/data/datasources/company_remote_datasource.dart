import 'package:portfolio/src/home/data/models/company_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CompanyRemoteDatasource {
  final SupabaseClient client;

  CompanyRemoteDatasource({required this.client});

  Future<List<CompanyModel>> fetchCompanies() async {
    final response = await client.from('companies').select();

    return response.map((json) => CompanyModel.fromJson(json)).toList();
  }
}
