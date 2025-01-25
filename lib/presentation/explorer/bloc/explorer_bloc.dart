import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/core/service_locator.dart';
import 'package:madagascar_workcoode/domain/repository/work_code_repository.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_event.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';

class ExplorerBloc extends Bloc<ExplorerEvent, ExplorerState> {
  ExplorerBloc() : super(ExplorerLoading()) {
    on<ExplorerLoadEvent>(loadData);

    add(ExplorerLoadEvent());
  }

  void loadData(
    ExplorerLoadEvent event,
    Emitter<ExplorerState> emitter,
  ) async {
    final repository = locator.get<WorkCodeRepository>();
    emitter(ExplorerLoading());
    try {
      final data = await repository.getWWorkCode();
      if (data.allArticles.length != 395) {
        emitter(ExplorerFailed());
      } else {
        emitter(ExplorerSuccess(workCode: data));
      }
    } catch (e) {
      emitter(ExplorerFailed());
    }
  }
}
