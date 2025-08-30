import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo4/data/requests/popular_request.dart';
import 'package:goo4/domain/models/popular_model.dart';
import 'package:meta/meta.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  static PopularCubit get(context) => BlocProvider.of(context);
  PopularModel? popularModel=PopularModel();

  getPopularPeople()async{
    emit(PopularLoading());
    popularModel=  await PopularRequest.getPopularPeople();
    if(popularModel!=null){
      emit(PopularSuccess());
    }
    else{
      emit(PopularError());
    }
  }
}
