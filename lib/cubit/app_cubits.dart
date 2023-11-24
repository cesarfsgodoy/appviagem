import 'package:appviagem/cubit/app_cubit_states.dart';
import 'package:appviagem/model/data_model.dart';
import 'package:appviagem/services/data_services.dart';
import 'package:bloc/bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      print("----------places=------");
      print(places);
      emit(LoadedState(places));
    } catch (e) {
      
    }
  }
  
  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }

}