part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
  const ProductEvent();
}
class ProductFetched extends ProductEvent{

}
