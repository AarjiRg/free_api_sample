

import 'package:equatable/equatable.dart';
import 'package:free_api_sample/model/product_resmodel.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class homeloadingstate extends HomeState {}

final class homeloadedstate extends HomeState {
 final List<products>? ListofProducts;
 homeloadedstate({this.ListofProducts}); 

   @override
  List<Object> get props => [];
}
final class homeerrorstate extends HomeState {
  String errorMessage;
  homeerrorstate({required this.errorMessage});
   @override
  List<Object> get props => [];
}
