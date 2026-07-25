
import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/src/home/domain/entities/company_entity.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<CompanyEntity>>> fetchCompanies();
}