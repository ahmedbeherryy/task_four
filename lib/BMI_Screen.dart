import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task_four/bmi_result_screen.dart';
class BMISScreen extends StatefulWidget {
  const BMISScreen({super.key});


  @override
  State<BMISScreen> createState() => _BMISScreenState();
}

class _BMISScreenState extends State<BMISScreen> {
bool isMale = true ;
double height =120;
int weight =40;
int age =20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 33,
        title: const Text('Body Mass Index',
        style: TextStyle(color:Colors.black,
        fontSize: 44,
          fontWeight: FontWeight.bold,

        ),
        ),
      ),
      body:
      Column(
        children: [
        Expanded(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        isMale =true;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Image.asset('assets/images/male.png',
                         height: 90,
                         width: 90,
                         ),
                          const SizedBox(height: 15,),
                          const Text('MALE',
                          style: TextStyle(fontSize: 25,
                              fontWeight:FontWeight.bold,
                          ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale ? Colors.blue :Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        isMale =false;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Image.asset('assets/images/female.png',
                         width: 90,
                           height: 90,
                         ),
                          const SizedBox(height: 15,),
                          const Text('FEMALE',
                            style: TextStyle(fontSize: 25,
                              fontWeight:FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:isMale ?Colors.grey[400] :  Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
        Expanded(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT',
                    style: TextStyle(fontSize: 25,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${height.round()}',
                        style: const TextStyle(fontSize: 40,
                          fontWeight:FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,),
                      const Text('CM',
                        style: TextStyle(fontSize: 20,
                          fontWeight:FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 220,
                      min: 60,
                      onChanged: (value){
                        setState(() {
                          height=value;
                        });
                       // print(value.round());
                      },
                  ),
                ],
              ),
            ),
          )
        ),
        Expanded(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT',
                          style: TextStyle(fontSize: 25,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                        Text('$weight',
                          style: const TextStyle(fontSize: 40,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: ()
                              {
                                setState(() {
                                  weight-=1;
                                });
                              },
                              heroTag: 'weight-',
                              mini: true,
                              child: const Icon(Icons.remove),

                            ),
                            FloatingActionButton(
                              onPressed: ()
                              {
                                setState(() {
                                  weight+=1;
                                });
                              },
                              heroTag: 'weight+',
                              mini: true,
                              child: const Icon(Icons.add),

                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE',
                          style: TextStyle(fontSize: 25,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                        Text('$age',
                          style: const TextStyle(fontSize: 40,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: ()
                              {
                                setState(() {
                                  age-=1;
                                });
                              },
                              heroTag: 'age-',
                              mini: true,
                              child: const Icon(Icons.remove),

                            ),
                            FloatingActionButton(
                              onPressed: ()
                              {
                                setState(() {
                                  age+=1;
                                });
                              },
                              heroTag: 'age+',
                              mini: true,
                              child: const Icon(Icons.add),

                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ) ,
        Container(
          width: double.infinity,
          color: Colors.blue,
          child: MaterialButton(
            onPressed: ()
            {
              double result =weight /pow(height/100,2);
              //print(result.round());
              Navigator.push(
                context,
              MaterialPageRoute(
                builder: (context) =>BMIResultScreen(
                  age: age,
                  isMale: isMale,
                  result: result.round(),
                ),

              ),
              );
            },
            height: 50,
          child: const Text('calculate',
          style: TextStyle(color: Colors.white),
          ),
          ),
        ),

      ],),
    );
  }
}
