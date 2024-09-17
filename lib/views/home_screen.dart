import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cityController.text = "Surat";
      Provider.of<WeatherProvider>(context, listen: false).fetchWeather(cityController.text.trim());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloudy_snowing),
            SizedBox(width: 5),
            Text(
              "Weather Forecasting",
              style: TextStyle(
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());
          return Container(
            color: provider.weather != null ? getBackgroundColor(provider.weather!.main) : Colors.white,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                //Search Widget
                TextFormField(
                  controller: cityController,
                  onEditingComplete: (){
                    cityController.text = cityController.text.trim();
                    if (cityController.text.isNotEmpty) {
                      FocusScope.of(context).unfocus();
                      Provider.of<WeatherProvider>(context, listen: false).fetchWeather(cityController.text);
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    hintText: "Enter Location",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(width: 1, color: Colors.blue),
                      gapPadding: 5,
                    ),
                    suffixIcon: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: TextButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("Search"),
                        ),
                        onPressed: () {
                          cityController.text = cityController.text.trim();
                          if (cityController.text.isNotEmpty) {
                            FocusScope.of(context).unfocus();
                            Provider.of<WeatherProvider>(context, listen: false).fetchWeather(cityController.text);
                          }
                        },
                      ),
                    ),
                  ),
                ),

                //Invalid or No-Data Widget
                if (!provider.isLoading && provider.weather == null)
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Image.network(
                          noDataImage,
                          width: 200,
                        ),
                        const Text(
                          "NO DATA",
                          style: TextStyle(fontSize: 15, letterSpacing: 5, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),

                //Loader Widget
                if (provider.isLoading)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: kElevationToShadow[1],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 10),
                            Text("Please wait")
                          ],
                        ),
                      ),
                    ],
                  ),

                //Today's date widget
                if (provider.weather != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          formattedDate,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                //Weather card widget
                if (provider.weather != null) WeatherCard(weather: provider.weather!)
              ],
            ),
          );
        },
      ),
    );
  }


}
