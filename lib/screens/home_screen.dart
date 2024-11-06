import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_api_sample/bloc/home/home_bloc.dart';
import 'package:free_api_sample/bloc/home/home_event.dart';
import 'package:free_api_sample/bloc/home/home_state.dart';
import 'package:free_api_sample/model/product_resmodel.dart';
import 'package:http/http.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
        if(state is homeloadingstate){
return Center(child: CircularProgressIndicator());
        }else if(state is homeloadedstate){
return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 8.0, 
        mainAxisSpacing: 10.0, 
        childAspectRatio: 0.7, 
      ),
      itemCount:state.ListofProducts!.length ,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0), 
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 250 ,
                  child: Image.network(state.ListofProducts![index].image.toString()),
                ),
          
                Text(state.ListofProducts![index].name.toString()),
                 Text(state.ListofProducts![index].description.toString()),
                  Text(state.ListofProducts![index].price.toString()),
          
              ],
            ),
          ),
        );
      },
    );
        }
        return SizedBox();
      }
    
      )
    );
  }
}

