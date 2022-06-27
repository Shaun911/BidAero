import 'dart:html';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter/foundation.dart';

class Airport {

  Airport({
    required this.name,
    required this.city,
    required this.country,
    required this.airportCode,
    required this.flags
  });

  final String name;
  final String city;
  final String country;
  final String airportCode;
  final Image flags;

  @override
    String toString() {
    return "$city, $country $flags" + "\n" + "$name $airportCode";
  }
}

List<Airport> airports = <Airport>[
  Airport(name: "Suvarnabhumi Airport", city: "Bangkok", country: "Thailand", airportCode: "BKK", flags: Image.asset('icons/flags/png/th.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Kuala Lumpur Intl", city: "Kuala Lumpur", country: "Malaysia", airportCode: "KUL", flags: Image.asset('icons/flags/png/my.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Penang Intl", city: "Penang", country: "Malaysia", airportCode: "PEN", flags: Image.asset('icons/flags/png/my.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Bandung", city: "Bandung", country: "Indonesia", airportCode: "BDO", flags: Image.asset('icons/flags/png/id.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Brunei Intl", city: "Bandar Seri Begawan", country: "Brunei", airportCode: "BWN", flags: Image.asset('icons/flags/png/bn.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Mactan Cebu Intl", city: "Cebu", country: "Philippines", airportCode: "CEB", flags: Image.asset('icons/flags/png/ph.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Da Nang", city: "Da Nang", country: "Vietnam", airportCode: "DAD", flags: Image.asset('icons/flags/png/vn.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Francisco Bangoy Intl", city: "Davao", country: "Philippines", airportCode: "DVO", flags: Image.asset('icons/flags/png/ph.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Ngurah Rai Intl", city: "Denpasar Bali", country: "Indonesia", airportCode: "DPS", flags: Image.asset('icons/flags/png/id.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Noi Bai Intl", city: "Hanoi", country: "Vietnam", airportCode: "HAN", flags: Image.asset('icons/flags/png/vn.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Tan Son Nhat", city: "Ho Chi Minh City", country: "Vietnam", airportCode: "SGN", flags: Image.asset('icons/flags/png/vn.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Soekarno Intl", city: "Jakarta", country: "Indonesia", airportCode: "CGK", flags: Image.asset('icons/flags/png/id.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Mandalay Intl", city: "Mandalay City", country: "Myanmar", airportCode: "MDL", flags: Image.asset('icons/flags/png/mm.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Ninoy Aquino Intl", city: "Manila", country: 'Philippines', airportCode: "MNL", flags: Image.asset('icons/flags/png/ph.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Kuala Namu Intl", city: "Medan", country: "Indonesia", airportCode: "KNO", flags: Image.asset('icons/flags/png/id.png', package: "country_icons", height: 30 , width: 30)),
Airport(name: "Pochentong", city: "Phnom Penh", country: "Cambodia", airportCode: "PNH", flags: Image.asset('icons/flags/png/kh.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Phuket Intl", city: "Phuket", country: "Thailand", airportCode: "HKT", flags: Image.asset('icons/flags/png/th.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Siem Reap", city: "Siem Reap", country: "Cambodia", airportCode: "REP", flags: Image.asset('icons/flags/png/kh.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Changi", city: "Singapore", country: "Singapore", airportCode: "SIN", flags: Image.asset('icons/flags/png/sg.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Juanda Intl", city: "Surabaya", country: "Indonesia", airportCode: "SUB", flags: Image.asset('icons/flags/png/id.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Yangon Intl", city: "Yangon", country: "Myanmar", airportCode: "RGN", flags: Image.asset('icons/flags/png/mm.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Capital", city: "Beijing", country: "China", airportCode: "PEK", flags: Image.asset('icons/flags/png/cn.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Gimhae Intl", city: "Busan", country: "South Korea", airportCode: "PUS", flags: Image.asset('icons/flags/png/kr.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Chengdu", city: "Chengdu", country: "China", airportCode: "CTU", flags: Image.asset('icons/flags/png/cn.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Chong Qing", city: "Chong Qing", country: "China", airportCode: "CKG", flags: Image.asset('icons/flags/png/cn.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Fukuoka Intl", city: "Fukuoka", country: "Japan", airportCode: "FUK", flags: Image.asset('icons/flags/png/jp.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Baiyun Intl", city: "Guangzhou", country: "China", airportCode: "CAN", flags: Image.asset('icons/flags/png/cn.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Hong Kong Intl", city: "Hong Kong", country: "Hong Kong SAR", airportCode: "HKG", flags: Image.asset('icons/flags/png/hk.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Chubu Centrair Intl", city: "Nagoya", country: "Japan", airportCode: "NGO", flags: Image.asset('icons/flags/png/jp.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Kansai Intl", city: "Osaka", country: "Japan", airportCode: "KIX", flags: Image.asset('icons/flags/png/jp.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Incheon Intl", city: "Seoul", country: "South Korea", airportCode: "ICN", flags: Image.asset('icons/flags/png/kr.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Pu Dong", city: "Shanghai", country: "China", airportCode: "PVG", flags: Image.asset('icons/flags/png/cn.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Shenzhen", city: "Shenzhen", country: "China", airportCode: "SZX", flags: Image.asset('icons/flags/png/cn.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Taoyuan Intl Airport", city: "Taipei", country: "Taiwan", airportCode: "TPE", flags: Image.asset('icons/flags/png/tw.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Narita", city: "Tokyo", country: "Japan", airportCode: "NRT", flags: Image.asset('icons/flags/png/jp.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Haneda Intl", city: "Tokyo", country: "Japan", airportCode: "HND", flags: Image.asset('icons/flags/png/jp.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Xiamen Gaoqi Intl", city: "Xiamen", country: "China", airportCode: "XMN", flags: Image.asset('icons/flags/png/cn.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Sardar Vallabhbhai Patel Intl", city: "Ahmedabad", country: "India", airportCode: "AMD", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Kempegowda Intl", city: "Bengaluru", country: "India", airportCode: "BLR", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Cape Town Intl", city: "Cape Town", country: "South Africa", airportCode: "CPT", flags: Image.asset('icons/flags/png/za.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Chennai Intl Airport", city: "Chennai", country: "India", airportCode: "MAA", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Bandaranaike Intl", city: "Colombo", country: "Sri Lanka", airportCode: "CMB", flags: Image.asset('icons/flags/png/lk.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Hazrat Shahjalal Intl", city: "Dhaka", country: "Bangladesh", airportCode: "DAC", flags: Image.asset('icons/flags/png/bd.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Dubai Intl", city: "Dubai", country: "United Arab Emirates", airportCode: "DXB", flags: Image.asset('icons/flags/png/ae.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Rajiv Gandhi Intl Airport", city: "Hyderabad", country: "India", airportCode: "HYD", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "O.R Tambo Intl", city: "Johannesburg", country: "South Africa", airportCode: "JNB", flags: Image.asset('icons/flags/png/za.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Tribhuvan Intl", city: "Kathmandu", country: "Nepal", airportCode: "KTM", flags: Image.asset('icons/flags/png/np.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Cochin Intl", city: "Kochi", country: "India", airportCode: "COK", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "NSC Bose Intl", city: "Kolkata", country: "India", airportCode: "CCU", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Velana Intl Airport", city: "Male", country: "Maldives", airportCode: "MLE", flags: Image.asset('icons/flags/png/mv.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Chhatrapati Shivaji Intl", city: "Mumbai", country: "India", airportCode: "BOM", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Indira Gandhi Intl", city: "Delhi", country: "India", airportCode: "DEL", flags: Image.asset('icons/flags/png/in.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Adelaide Intl", city: "Adelaide", country: "Australia", airportCode: "ADL", flags: Image.asset('icons/flags/png/au.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Auckland Intl" ,city: "Auckland", country: "New Zealand", airportCode: "AKL", flags: Image.asset('icons/flags/png/nz.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Brisbane Intl", city: "Brisbane", country: "Australia", airportCode: "BNE", flags: Image.asset('icons/flags/png/au.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Cairns", city: "Cairns", country: "Australia", airportCode: "CNS", flags: Image.asset('icons/flags/png/au.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Christchurch Intl", city: "Christchurch", country: "New Zeland", airportCode: "CHC", flags: Image.asset('icons/flags/png/nz.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Darwin", city: "Darwin", country: "Australia", airportCode: "DRW", flags: Image.asset('icons/flags/png/au.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Melbourne Intl", city: "Melbourne", country: "Australia", airportCode: "MEL", flags: Image.asset('icons/flags/png/au.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Perth Intl", city: "Perth", country: "Australia", airportCode: "PER", flags: Image.asset('icons/flags/png/au.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Kingsford Smith", city: "Sydney", country: "Netherlands", airportCode: "AMS", flags: Image.asset('icons/flags/png/nl.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Barcelona El Prat Airport", city: "Barcelona", country: "Spain", airportCode: "BCN", flags: Image.asset('icons/flags/png/es.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Copenhagen", city: "Copenhagen", country: "Denmark", airportCode: "CPH", flags: Image.asset('icons/flags/png/dk.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Rhein Main", city: "Frankfurt", country: "Germany", airportCode: "FRA", flags: Image.asset('icons/flags/png/de.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Istanbul Airport", city: "Istanbul", country: "Turkey", airportCode: "IST", flags: Image.asset('icons/flags/png/tr.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Heathrow", city: "London", country: "United Kingdom", airportCode: "LHR", flags: Image.asset('icons/flags/png/gb.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Manchester Ringway Intl", city: "Manchester", country: "United Kingdom", airportCode: "MAN", flags: Image.asset('icons/flags/png/gb.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Maipensa", city: "Milan", country: "Italy", airportCode: "MXP", flags: Image.asset('icons/flags/png/it.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Domodedovo Intl", city: "Moscow", country: "Russia", airportCode: "DME", flags: Image.asset('icons/flags/png/ru.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Franz Josef Strauss", city: "Munich", country: "Germany" , airportCode: "MUC", flags: Image.asset('icons/flags/png/de.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Charles De Gaulle", city: "Paris", country: "France", airportCode: "CDG", flags: Image.asset('icons/flags/png/fr.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Leonardo da Vinci", city: "Rome", country: "Italy", airportCode: "FCO", flags: Image.asset('icons/flags/png/it.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Zurich Kloten", city: "Zurich", country: "Switzerland", airportCode: "ZRH", flags: Image.asset('icons/flags/png/ch.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Intercontinental", city: "Houston", country: "United States of America", airportCode: "IAH", flags: Image.asset('icons/flags/png/us.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Los Angeles Intl", city: "Los Angeles", country: "United States of America", airportCode: "LAX", flags: Image.asset('icons/flags/png/us.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "John F Kennedy Intl", city: "New York", country: "United States of America", airportCode: "JFK", flags: Image.asset('icons/flags/png/us.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Newark Intl", city: "New York", country: "United States of America", airportCode: "EWR", flags: Image.asset('icons/flags/png/us.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "San Francisco", city: "San Francisco", country: "United States of America", airportCode: "SFO", flags: Image.asset('icons/flags/png/us.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Tacoma Intl Airport", city: "Seattle", country: "United States of America", airportCode: "SEA", flags: Image.asset('icons/flags/png/us.png', package: "country_icons", height: 30 , width: 30)),
  Airport(name: "Vancouver Intl", city: "Vancouver", country: "Canada", airportCode: "YVR", flags: Image.asset('icons/flags/png/ca.png', package: "country_icons", height: 30 , width: 30))
];
