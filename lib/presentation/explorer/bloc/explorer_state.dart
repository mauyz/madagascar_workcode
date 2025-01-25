import 'package:madagascar_workcoode/domain/model/work_code.dart';

sealed class ExplorerState {}

class ExplorerLoading extends ExplorerState {}

class ExplorerFailed extends ExplorerState {}

class ExplorerSuccess extends ExplorerState {
  final WorkCode workCode;

  ExplorerSuccess({required this.workCode});
}
