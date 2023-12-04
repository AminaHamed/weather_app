import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_states.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/widgets/default_widget.dart';
import 'package:weather_app/pages/widgets/weather_data_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is LoadingData) {
            return const CircularProgressIndicator();
          }
          if (state is LoadingSuccess) {
            return WeatherDataWidget();
          }
          if (state is LoadingFailure) {
            return const Text('error');
          } else {
            return const DefaultWidget();
          }
        },
      ),
    );
  }
}
