import 'package:easycare/Splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController customernamecontroller= TextEditingController();
  TextEditingController productnamecontroller= TextEditingController();
  TextEditingController qtycontroller= TextEditingController();
  TextEditingController pricecontroller= TextEditingController();
  TextEditingController remarkscontroller= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Container(

                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 5),
                  decoration: BoxDecoration(
                    boxShadow:const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: -5,
                        blurRadius: 17,
                        offset: Offset(0, 3),
                      )
                    ],
                    border: Border.all(width: 0.5, color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blueAccent,
                        Color.fromARGB(90,70, 50, 200),
                      ],
                    ),
                  ),

                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 30,left: 0,right: 10),
                        child: const Text("Welcome ! ",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white

                          ),
                        ),
                      ),


                      SizedBox(height: 10,),



                      Container (
                        child:const  Text("Add the product",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,


                          ),
                        ),

                      ),
                      SizedBox(height: 60,),


                      Container(
                        padding: EdgeInsets.only(left: 200,right: 30),
                              child:TextField(

                                  controller: customernamecontroller,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration:const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red,)
                                    ),


                                    hintText: "Enter the name of Product",



                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),


                                  )),




                      ),
                      SizedBox(height: 5,),


                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(

                            controller: productnamecontroller,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red,)
                              ),


                              hintText: "Enter the name of Product",



                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),


                            )),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(
                            controller: qtycontroller,
                            keyboardType: TextInputType.number,
                            obscureText: true,

                            style:const  TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(

                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)
                              ),
                              hintText: "Enter the quantity",

                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),


                            )),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(
                            controller: pricecontroller,
                            keyboardType: TextInputType.number,
                            obscureText: true,

                            style:const  TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(

                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              hintText: "Enter the Sales Price",

                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(
                            controller: remarkscontroller,
                            keyboardType: TextInputType.number,
                            obscureText: true,

                            style:const  TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(

                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              hintText: "Write the remarks",

                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )),
                      ),
                      SizedBox(height: 15,),


                      Container(
                        padding: EdgeInsets.only(left:120,right: 120),
                        child: ElevatedButton(onPressed: (){
                        //  validateForm();
                        },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red.withOpacity(0.7),
                              minimumSize: const Size.fromHeight(45),
                              maximumSize: const Size.fromHeight(50),

                            ),
                            child: Text("Add",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,


                              ),

                            )),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right:10),

                        child: Column(
                          children: [
                            Container(
                              child: Table(
                                  border: TableBorder.all(), // Allows to add a border decoration around your table
                                  children:const [
                                    TableRow(children :[
                                      Text('Product Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                      Text('Qty',style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Price',style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Subtotal',style: TextStyle(fontWeight: FontWeight.bold)),
                                    ]),
                                    TableRow(children :[
                                      Text('bhjkhljhkj',),
                                      Text('2'),
                                      Text('3'),
                                      Text('43')
                                    ]),
                                    TableRow(children :[
                                      Text('jgkhjljkhkjsss'),
                                      Text('78'),
                                      Text('24'),
                                      Text('459')
                                    ]),
                                    TableRow(children :[
                                      Text('hjgkhgjh'),
                                      Text('26'),
                                      Text('12'),
                                      Text('45')
                                    ]),
                                    TableRow(children :[
                                      Text('hjgkhgjh'),
                                      Text('26'),
                                      Text('12'),
                                      Text('45')
                                    ]),TableRow(children :[
                                      Text('hjgkhgjh'),
                                      Text('26'),
                                      Text('12'),
                                      Text('45')
                                    ]),TableRow(children :[
                                      Text('hjgkhgjh'),
                                      Text('26'),
                                      Text('12'),
                                      Text('45')
                                    ]),TableRow(children :[
                                      Text('hjgkhgjh'),
                                      Text('26'),
                                      Text('12'),
                                      Text('45')
                                    ]),
                                  ]
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 250),
                              child: TextField(
                                  controller: pricecontroller,
                                  keyboardType: TextInputType.number,
                                  obscureText: true,

                                  style:const  TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration:const InputDecoration(

                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red)
                                    ),
                                      hintText: "Rs. 856461",

                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 250),
                              child: Text("Grand Total",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              padding: EdgeInsets.only(left:120,right: 120),
                              child: ElevatedButton(onPressed: (){
                                //  validateForm();
                              },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red.withOpacity(0.7),
                                    minimumSize: const Size.fromHeight(45),
                                    maximumSize: const Size.fromHeight(50),

                                  ),
                                  child: Text("Save",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,


                                    ),

                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],

                  ),


                ),



              ],
            ),

          ),
        ),
      ),
    );
  }
}
