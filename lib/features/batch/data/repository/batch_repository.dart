import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/data/data_source/local/batch_local_datasource.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/repository/batch_repository.dart';

final batchLocalRepository = Provider<IBatchRepository>((ref) {
  return BatchLocalRepository(
    batchLocalDatasource: ref.read(batchLocalDatasourceProvider),
  );
});

class BatchLocalRepository implements IBatchRepository {
  final BatchLocalDatasource batchLocalDatasource;
  BatchLocalRepository({required this.batchLocalDatasource});
  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    // TODO: implement addBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    // TODO: implement getAllBatches
    throw UnimplementedError();
  }
}
