import 'package:day12/cubits/get_products_cubit/get_products_states.dart';
import 'package:day12/models/products_model.dart';
import 'package:day12/services/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  Products? products ;
  Future<void>getProducts() async {
    emit(GetProductsLoading());
    try{
      products = await ApiProvider().getProducts();
      emit(GetProductsLoaded(products!));
    }catch(e){
      emit(GetProductsError(e.toString()));
    }
}}