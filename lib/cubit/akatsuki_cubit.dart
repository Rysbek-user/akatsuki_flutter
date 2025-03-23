import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../model.dart';

part 'akatsuki_state.dart';

class AkatsukiCubit extends Cubit<AkatsukiState> {
  AkatsukiCubit() : super(AkatsukiInitial()) {
    _loadCachedData();
  }

  Future<void> getAkatsuki() async {
    emit(AkatsukiDataLoading());
    try {
      final dio = Dio();
      const baseUrl = 'https://dattebayo-api.onrender.com/';
      const endPoint = 'akatsuki';
      final response = await dio.get('$baseUrl$endPoint');
      final List<dynamic> mapResponse = response.data['akatsuki'];
      final listResponse =
          mapResponse.map((data) => AkatsukiInfo.fromJson(data)).toList();

      final box = await Hive.openBox<AkatsukiInfo>('akatsukiBox');
      await box.clear();
      await box.addAll(listResponse);

      emit(AkatsukiDataSuccess(list: listResponse));
    } catch (e) {
      await _loadCachedData();
    }
  }

  Future<void> _loadCachedData() async {
    final box = await Hive.openBox<AkatsukiInfo>('akatsukiBox');
    final cachedList = box.values.toList();
    if (cachedList.isNotEmpty) {
      emit(AkatsukiDataSuccess(list: cachedList));
    } else {
      emit(AkatsukiInitial());
    }
  }
}
