import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);
  // 1
  // final String category = 'Editor\'s Choice';
  // final String title = 'The Art of Dough';
  // final String description = 'Learn to make the perfect bread.';
  // final String chef = 'Ray Wenderlich';
  // 2
  @override
  Widget build(BuildContext context) {
    // 3
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Choose a Category'),
        ),
      ),
      body: GridView.count(
        
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.

        crossAxisCount: 4,
        crossAxisSpacing: 5,
        padding: EdgeInsets.all(15.0),

        children: [
          // SizedBox(height: 5.0),
          Container(
              child: Card(
                  elevation: 6.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Depressed",
                        style: Theme.of(context).textTheme.headline3,
                        // style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "BurnOut",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Sad",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Stress",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Anxious",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Fear",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Panic",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Emotional",
                            style: Theme.of(context).textTheme.headline3,
                          ))
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Lonely",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Study",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Success",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Bully",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
          Container(
              child: Card(
                  elevation: 10.0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        "Insecure",
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ))),
        ],

        // Generate 100 widgets that display their index in the List.
        // children: List.generate(20, (index) {
        //   return Card(
        //     color: Colors.teal,
        //     elevation: 8,
        //     margin: EdgeInsets.all(7.0),
        //     shape:
        //         BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        //     child: Center(
        //       // child : Container(
        //       child: Text(
        //         "Depressed",
        //       ),

        //       // Container(
        //     ),
        //   );
        //   // child: Text(
        //   //   'Betel',
        //   //   // title,
        //   //   style: FooderlichTheme.darkTextTheme.headline5,

        //   // ),
        // }),
      ),
    );
  }
}
// body: GridView.count(
//     crossAxisCount: 2,

//     primary: false,
//     mainAxisSpacing: 5,
//     crossAxisSpacing: 5,
//     padding: const EdgeInsets.all(20),
//     children: [
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(
//       children: [
//         Image(image: AssetImage("assets/6.jpg")),
//         Container(
//           color: Colors.black.withOpacity(50),
//           height: 70,
//           child: Row(
//             children: [
//               Column(
//                 children: [Text("Zendaya"), Text("Beautiful Girl")],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 40),
//                 child: Icon(Icons.favorite),
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   ),
//   Container(
//     height: double.infinity,
//     width: double.infinity,
//     child: Stack(children: [
//       Image(image: AssetImage("assets/6.jpg")),
//       Container(
//         color: Colors.black.withOpacity(50),
//         height: 70,
//         child: Row(
//           children: [
//             Column(
//               children: [Text("ZENdaya"), Text("Beautiful Girl")],
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 40),
//               child: Icon(Icons.favorite),
//             )
//           ],
//         ),
//       ),
//     ]),
//   )
// ]));
