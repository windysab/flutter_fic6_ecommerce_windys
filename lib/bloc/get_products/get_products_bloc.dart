

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/product_remote_datasource.dart';
import '../../data/models/responses/list_product_response_model.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRemoteDatasource datasource;
  GetProductsBloc(
    this.datasource,
  ) : super(const GetProductsState()) {
    
    on<DoGetProductsEvent>((event, emit) async {
      emit(state.copyWith(status: GetProductsStatus.loading));
      try {
        final Either<String, ListProductResponseModel> data = await datasource.getAllProduct();
        emit(state.copyWith(
          status: GetProductsStatus.loaded,
          data: data.fold((l) => null, (r) => r)
        ));
      } catch (e) {
        emit(state.copyWith(status: GetProductsStatus.error));
      }
    });
  }
}
