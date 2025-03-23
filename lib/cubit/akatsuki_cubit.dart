import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../model.dart';

part 'akatsuki_state.dart';

class AkatsukiCubit extends Cubit<AkatsukiState> {
  AkatsukiCubit() : super(AkatsukiInitial());

  void getAkatsuki() async {
    final dio = Dio();
    emit(AkatsukiDataLoading());
    final baseUrl = 'https://dattebayo-api.onrender.com/';
    final endPoint = 'akatsuki';
    final response = await dio.get('$baseUrl$endPoint');
    final List<dynamic> mapResponse = response.data['akatsuki'];
    final listResponse =
    mapResponse.map((data) => AkatsukiInfo.fromJson(data)).toList();
    emit(AkatsukiDataSuccess(list: listResponse));
  }
}