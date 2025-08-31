import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo4/data/requests/popular_request.dart';
import 'package:goo4/domain/models/popular_people_details_model.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  static DetailsCubit get(context) => BlocProvider.of(context);
  PopularPeopleDetailsModel? popularPeopleDetailsModel =
      PopularPeopleDetailsModel();

  getDetails(num id) async {
    emit(DetailsLoading());
    var response = await PopularRequest.getPopularPeopleDetails(id);
    if (response != null) {
      log(response.biography.toString());
      popularPeopleDetailsModel=response;
      emit(DetailsSuccess());
    } else {
      emit(DetailsError());
    }
  }
}
