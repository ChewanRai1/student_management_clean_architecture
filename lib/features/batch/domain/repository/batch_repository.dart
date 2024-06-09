import 'package:dartz/dartz.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

abstract class IBatchRepository {
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
}
