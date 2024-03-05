import 'package:country_state_city/country_state_city.dart';

class StateCity {
  Future<List<String>> allStates() async {
    var indianStates = await getStatesOfCountry('IN');
    List<String> rType = [];
    for (var state in indianStates) {
      rType.add(state.name);
    }
    print(rType);
    return rType;
  }

  void getAllCitiesInIndia() async {
    // Get all cities in India
    var cities = await getAllCities();

    // Filter cities of India
    var indianCities = cities.where((city) => city.countryCode == 'IN').toList();

    // Extract city names
    var cityNames = indianCities.map((city) => city.name).toList();

    // Print all city names of India
    print(cityNames);
  }

    // Future<List<String>> getCitiesInState(String stateName) async {
    //   // Get all cities of the specified state
    //   var cities = await getAllCities();
    //   var citiesInState = <String>[];
    //
    //   // Iterate through all cities and add those belonging to the specified state
    //   for (var city in cities) {
    //     var cityState = await getStateByCode(city.stateCode);
    //     if (cityState.name == stateName) {
    //       citiesInState.add(city.name);
    //     }
    //   }
    //
    //   return citiesInState;
    // }
  }
