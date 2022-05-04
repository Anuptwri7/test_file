



import 'package:flutter/foundation.dart';

class Customer {
  String? id;
  String? first_name;
  String? middle_name;
  String? last_name;

  // String ?subDomain;
  // bool ?active;

  Customer({
    this.id,
    this.first_name,
     this.middle_name,
     this.last_name,
    //  required this.subDomain,
    // required this.active
  });

  factory Customer.fromJson(Map<String, dynamic> json ) {
    return Customer(
      id: json['id'],
      first_name: json['first_name'],
      middle_name: json['middle_name'],
      last_name: json['last_name'],
      //  subDomain: json['subDomain'],
      // active: json['active'],
    );

  }
}

class CustomerListResponse {
  List<Customer>? results;

  CustomerListResponse({this.results});

  factory CustomerListResponse.fromJson(Map<String, dynamic> json) {
    List<Customer> customers = json['results'].map<Customer>((customer) => Customer.fromJson(customer)).toList();
    return CustomerListResponse(
      results: customers
    );


  }
}