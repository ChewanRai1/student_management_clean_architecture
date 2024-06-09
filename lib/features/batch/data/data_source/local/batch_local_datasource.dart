import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/local/hive_service.dart';
import 'package:student_management_starter/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

final batchLocalDatasourceProvider = Provider(
  (ref) => BatchLocalDatasource(
    hiveService: ref.read(hiveServiceProvider),
    batchHiveModel: ref.read(batchHiveModelProvider),
  ),
);

class BatchLocalDatasource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDatasource({
    required this.hiveService,
    required this.batchHiveModel,
  });
  //Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      //Convert Entity to Hive Object
      final hiveBatch = batchHiveModel.fromEntity(batch);

      //Add to Hive
      await hiveService.addBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  //Gett All Batches
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      //Get All Batches from hive
      final hiveBatches = await hiveService.getAllBatches();
      //Convert Hive List to entity List
      // As the database returns BatchHiveModel
      final batches = batchHiveModel.toEntityList(hiveBatches);
      return Right(batches);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
