import 'package:bloc/bloc.dart';
import 'package:free_api_sample/bloc/home/home_event.dart';
import 'package:free_api_sample/bloc/home/home_state.dart';
import 'package:free_api_sample/model/product_resmodel.dart';
import 'package:free_api_sample/utils/app_utils.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';




class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(homeloadingstate());
           
       var url =  Uri.parse("https://freeapi.luminartechnohub.com/products-all/");
      
       try {
         final response =await http.get(url,headers: {"Authorization":"Bearer ${await AppUtils.getaccesstoken()}"});
         if(response.statusCode == 200){
          Productresmodel resmmodel = productresmodelFromJson(response.body);
          emit(homeloadedstate(ListofProducts:resmmodel.ListofProducts ?? []));
         }
         else {
emit(HomeInitial());
         }
       } catch (e) {
         emit(homeerrorstate(errorMessage: e.toString()));
       }
     
    });
  }
}
