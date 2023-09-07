part of 'get_products_bloc.dart';

// abstract class GetProductsState extends Equatable {
//   const GetProductsState();

//   @override
//   List<Object?> get props => [];
// }

// class GetProductsInitial extends GetProductsState {}

// class GetProductsLoading extends GetProductsState {}

// class GetProductsLoaded extends GetProductsState {
//   final ListProductResponseModel data;

//   // ignore: prefer_const_constructors_in_immutables
//   GetProductsLoaded({
//     required this.data,
//   });

//   @override
//   List<Object?> get props => [data];

//   @override
//   bool? get stringify => true; // Optional, enables toString() for debugging.
// }

// class GetProductsError extends GetProductsState {}

enum GetProductsStatus {
  initial,
  loading,
  loaded,
  error,
}

class GetProductsState extends Equatable {
  const GetProductsState({
    this.status = GetProductsStatus.initial,
    this.data,
  });
  factory GetProductsState.initial() => const GetProductsState();
  final ListProductResponseModel? data;
  final GetProductsStatus status;

  @override
  List<Object?> get props => [status, data];

  @override
  String toString() => 'GetProductsState(data: $data, status: $status)';

  GetProductsState copyWith({
    ListProductResponseModel? data,
    GetProductsStatus? status,
  }) {
    return GetProductsState(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}
