import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/bloc/bloc/weather_search_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController search = TextEditingController();
  var cityData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: ,
        title: const Text("Geolocation App"),
      ),
      // backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: search,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Enter city name",
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      )),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ))),
              onChanged: (value) {
                if (value.length >= 3) {
                  BlocProvider.of<WeatherSearchBloc>(context)
                      .add(WeatherSearchEventRequested(search.text));
                }
              },
            ),
            BlocBuilder<WeatherSearchBloc, WeatherSearchState>(
              builder: (context, state) {
                if (state is WeatherSearchLoading) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (state is WeatherSearchFailed) {
                  return const Expanded(
                    child: Center(child: Text("Failed to load")),
                  );
                }
                if (state is WeatherSearchLoaded) {
                  return Expanded(
                    child: Center(
                      child: ListView.builder(
                          itemCount: state.weatherData.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.weatherData[index].name ?? "Chicago",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    direction: Axis.vertical,
                                    children: [
                                      Text(
                                        state.weatherData[index].countryId
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        state.weatherData[index].country
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  );
                }
                return Expanded(
                  child: Container(
                    child: const Center(child: Text("Enter at least 3 char ")),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
