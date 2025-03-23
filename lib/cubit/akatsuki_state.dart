part of 'akatsuki_cubit.dart';

@immutable
sealed class AkatsukiState {}

final class AkatsukiInitial extends AkatsukiState {}

final class AkatsukiDataLoading extends AkatsukiState {}

final class AkatsukiDataSuccess extends AkatsukiState {
  final List<AkatsukiInfo> list;

  AkatsukiDataSuccess({required this.list});
}
