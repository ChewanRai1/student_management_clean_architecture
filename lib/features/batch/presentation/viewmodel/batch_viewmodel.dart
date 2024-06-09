import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/usecase/batch_use_case.dart';
import 'package:student_management_starter/features/batch/presentation/state/batch_state.dart';

class BatchViewmodel extends StateNotifier<BatchState> {
  BatchViewmodel(this.batchUseCase) : super(BatchState.initial());

  final BatchUseCase batchUseCase;

  addBatch(BatchEntity batch) async {
    //To show the progrea bar
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.addBatch(batch);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        //Show the error message
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        //show the success message
      },
    );
  }
}
