import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherFactory wf = WeatherFactory(API_KEY);
  final TextEditingController searchBox = TextEditingController();

  Weather? _weather;

  @override
  void initState() {
    super.initState();
    wf.currentWeatherByCityName("Dhaka").then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  void search() {
    setState(() {
      wf.currentWeatherByCityName(searchBox.text).then((w) {
        setState(() {
          _weather = w;
        });
      });
    });
  }

  Widget _imageShower(int n){
      switch(n){
        case >200 && <300 :
          return Image.asset("assets/1.png", height:250,);
          break;
        case >300 && <400:
          return Image.asset("assets/2.png",height: 250);
          break;
        case >500 && <600 :
          return Image.asset("assets/3.png",height: 250);
          break;
        case >600 && <700 :
          return Image.asset("assets/4.png",height: 250);
          break;
        case >700 && <800 :
          return Image.asset("assets/5.png",height: 250);
          break;
        case == 800:
          return Image.asset("assets/6.png",height: 250);
          break;
        case == 801:
          return Image.asset("assets/7.png",height: 250);
          break;
        case == 802:
          return Image.asset("assets/8.png",height: 250);
          break;
        case == 803:
          return Image.asset("assets/9.png",height: 250);
          break;
        case == 804:
          return Image.asset("assets/5.png",height: 250);
          break;
        default:
          return Image.asset("assets/6.png",height: 250);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
        Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(204, 102, 0,40), Color.fromRGBO(128, 128, 255,70)]
                )
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: searchBox,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Search for city',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: search,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white,alignment: Alignment.center),
                  child: const Text("Search", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _weather?.areaName ?? "",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                _imageShower(_weather!.weatherConditionCode!),
                Text(
                  _weather?.weatherDescription ?.toUpperCase()?? "",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 8,),
                Text("${_weather?.temperature?.celsius?.toStringAsFixed(0)} °C",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold),),
                Text(DateFormat.EEEE().add_jms().format(DateTime.now()),style: TextStyle(
                  fontSize: 20,)),
                SizedBox(width: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/11.png",scale: 8,),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sunrise",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                      ),),
                      SizedBox(width: 5,),
                      Text(DateFormat().add_jm().format(_weather!.sunrise!),style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Image.asset("assets/12.png",scale: 8,),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sunset",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                        ),),
                      SizedBox(width: 5,),
                      Text(DateFormat().add_jm().format(_weather!.sunset!),style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
                ),
                Divider(thickness: 2,color: Colors.transparent,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/13.png",scale: 8,),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Max Temp.",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                          ),),
                        Text("${_weather?.tempMax?.celsius?.round()} °C", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(width: 20,),
                    Image.asset("assets/14.png",scale: 8,),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Min Temp.",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                          ),),
                        Text("${_weather?.tempMin?.celsius?.round()} °C",style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 2,color: Colors.transparent,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/humidity.png", scale: 10,),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Humidity",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300
                          ),),
                        Text("${_weather?.humidity?.round()}%",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Image.asset("assets/windy.png", scale: 10,),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wind",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300
                        ),),
                        Text("${_weather?.windSpeed}m/s",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
