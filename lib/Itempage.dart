import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:reciepy_app/detailsPage.dart';
import 'package:reciepy_app/variable.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ItemClass extends StatefulWidget {
  const ItemClass({super.key});

  @override
  State<ItemClass> createState() => _ItemClassState();
}

class _ItemClassState extends State<ItemClass> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var url = Uri.https('dummyjson.com', 'recipes');
    var response = await http.get(url);
    setState(() {
      Map ApiMap = jsonDecode(response.body);
      ApiList = ApiMap['recipes'];
      tempList = List.from(ApiList);
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      // print("ApiList : $ApiList");
    });
    for (int i = 0; i < ApiList.length; i++) {
      print("1  :${ApiList[i]}");
      for (int j = 0; j < ApiList[i]["mealType"].length; j++) {
        print("2  :${ApiList[i]["mealType"]}");
        if (!(mealList.contains(ApiList[i]['mealType'][j]))) {
          mealList.add(ApiList[i]['mealType'][j]);
        }
      }
    }
    print("meal List : $mealList");
  }

  ItemScrollController itemScrollController = ItemScrollController();
  int tempind = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff080817),
      drawer: (tempList.isNotEmpty)
          ? Drawer(
              width: 250,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  DrawerHeader(
                    curve: decelerateEasing,
                    decoration: BoxDecoration(
                      color: Color(0xff080817),
                    ), //BoxDecoration
                    child: UserAccountsDrawerHeader(
                      currentAccountPictureSize: Size(70, 70),
                      decoration: BoxDecoration(
                        color: Color(0xff080817),
                      ),
                      accountName: Text(
                        "Sanjeev Kapoor",
                        style: TextStyle(fontSize: 18),
                      ),
                      accountEmail: Text("chefsanjeev03@gmail.com"),
                      currentAccountPicture: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assert/spleshimg/kapoor.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ), //UserAccountDrawerHeader
                  ), //DrawerHeader
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(' My Profile '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text(' My Course '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.workspace_premium),
                    title: const Text(' Go Premium '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.video_label),
                    title: const Text(' Saved Videos '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text(' Edit Profile '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('LogOut'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      appBar: (tempList.isNotEmpty)
          ? PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: AppBar(
                elevation: 0,
                backgroundColor: const Color(0xff080817),
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent),
                title: const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Kapoor",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        "What you want cook today?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white54,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assert/spleshimg/kapoor.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    height: 30.0,
                    width: 200.0, // Adjust width according to your title length
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade500.withOpacity(.5),
                    ),
                  ),
                ),
                actions: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      height: 80,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500.withOpacity(.5),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
      body: (tempList.isNotEmpty)
          ? ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(
                overscroll: false,
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: ScrollablePositionedList.builder(
                            itemScrollController: itemScrollController,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: mealList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, ind) {
                              return methodlist(ind);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CupertinoTextField(
                          onChanged: (value) {
                            setState(() {
                              tempind = 0;
                              print("tempind :: $tempind");
                              print("val : $value");
                              if (tempList.isNotEmpty) {
                                ApiList = tempList
                                    .where((element) => element['name']
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            value.toString().toLowerCase()))
                                    .toList();
                              }
                            });
                          },
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500.withOpacity(.3),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(15),
                          cursorWidth: 2,
                          cursorRadius: Radius.circular(10),
                          cursorColor: Colors.white38,
                          cursorOpacityAnimates: true,
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.white60,
                              size: 20,
                            ),
                          ),
                          placeholder: "Find your favorite recipe...",
                          placeholderStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "${ApiList.length} new recipes",
                          style: TextStyle(
                              color: const Color(0xeacb991c).withOpacity(.6),
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 20),
                          child: ScrollConfiguration(
                            behavior:
                                ScrollBehavior().copyWith(overscroll: false),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: ApiList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 18,
                                      crossAxisSpacing: 12,
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                          (MediaQuery.of(context).size.height -
                                              330)),
                              itemBuilder: (context, index) {
                                return Gridmethod1(index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, bottom: 18, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4, // Replace this with your actual itemCount
                      itemBuilder: (BuildContext context, int index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade500.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.grey.shade200,
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500.withOpacity(.5),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 12,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height - 420)),
                        itemCount: 6, // Replace this with your actual itemCount
                        itemBuilder: (BuildContext context, int index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.grey.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500.withOpacity(.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget Gridmethod1(int index) {
    final _ratingController = TextEditingController();
    double rating = double.parse("${ApiList[index]['rating']}");

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.pushReplacement(context, CupertinoPageRoute(
          builder: (context) {
            return detailsClass(IndexMap: ApiList[index], rateing: rating);
          },
        ));
      },
      child: StatefulBuilder(
        builder: (BuildContext context, setState1) {
          return Stack(
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: Colors.grey.shade500.withOpacity(.30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Text(
                        "${ApiList[index]["name"]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GFRating(
                      color: const Color(0xeacb991c),
                      borderColor: const Color(0xeacb991c),
                      value: rating,
                      size: 15,
                      allowHalfRating: true,
                      controller: _ratingController,
                      onChanged: (value) {
                        setState1(() {
                          rating = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.stopwatch,
                          color: Colors.white60,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${ApiList[index]["prepTimeMinutes"]} min",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  height: 130,
                  width: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "${ApiList[index]['image']}",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      height: 130,
                      width: 130,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white12,
                              strokeWidth: 2.4,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget methodlist(int ind) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            radius: 20,
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              setState(() {
                print("temind = $tempind");
                print("ind = $ind");
                itemScrollController.scrollTo(
                    index: ind, duration: Duration(milliseconds: 1500));
                tempind = ind;

                if (tempind == 0) {
                  ApiList = List.from(tempList);
                } else {
                  if (mealList.isNotEmpty) {
                    ApiList = tempList
                        .where((element) => element['mealType']
                            .toString()
                            .toLowerCase()
                            .contains(mealList[ind].toString().toLowerCase()))
                        .toList();
                    setState(() {});
                  }
                }
                print("temind = $tempind");
                print("ind = $ind");
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text(
                "${mealList[ind]}",
                style: TextStyle(
                  color: (ind == tempind) ? Colors.white70 : Colors.white38,
                  fontSize: 18,
                  fontWeight:
                      (ind == tempind) ? FontWeight.w500 : FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Container(
              height: (ind == tempind) ? 2.5 : 0,
              width: (ind == tempind) ? 15 : 0,
              decoration: (ind == tempind)
                  ? BoxDecoration(
                      color: Color(0xff2F7C2c),
                      borderRadius: BorderRadius.circular(5))
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

//import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:getwidget/components/rating/gf_rating.dart';
// import 'package:reciepy_app/detailsPage.dart';
// import 'package:reciepy_app/variable.dart';
// import 'package:http/http.dart' as http;
// import 'package:shimmer/shimmer.dart';
//
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
//
// class ItemClass extends StatefulWidget {
//   const ItemClass({super.key});
//
//   @override
//   State<ItemClass> createState() => _ItemClassState();
// }
//
// class _ItemClassState extends State<ItemClass> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     init();
//   }
//
//   init() async {
//     var url = Uri.https('dummyjson.com', 'recipes');
//     var response = await http.get(url);
//     setState(() {
//       Map ApiMap = jsonDecode(response.body);
//       ApiList = ApiMap['recipes'];
//       tempList = List.from(ApiList);
//       // print('Response status: ${response.statusCode}');
//       // print('Response body: ${response.body}');
//       // print("ApiList : $ApiList");
//     });
//     for (int i = 0; i < ApiList.length; i++) {
//       print("1  :${ApiList[i]}");
//       for (int j = 0; j < ApiList[i]["tags"].length; j++) {
//         print("2  :${ApiList[i]["tags"]}");
//         if (!(mealList.contains(ApiList[i]['tags'][j]))) {
//           mealList.add(ApiList[i]['tags'][j]);
//         }
//       }
//     }
//     print("meal List : $mealList");
//   }
//
//   ItemScrollController itemScrollController = ItemScrollController();
//   int tempind = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff080817),
//       appBar: (tempList.isNotEmpty)
//           ? PreferredSize(
//               preferredSize: const Size.fromHeight(70),
//               child: AppBar(
//                 elevation: 0,
//                 backgroundColor: const Color(0xff080817),
//                 systemOverlayStyle: const SystemUiOverlayStyle(
//                     statusBarColor: Colors.transparent),
//                 title: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Hello, Kapoor",
//                         style: TextStyle(
//                             fontSize: 23,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                       ),
//                       SizedBox(
//                         height: 1,
//                       ),
//                       Text(
//                         "What you want cook today?",
//                         style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white54,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: Image.asset(
//                         "assert/spleshimg/kapoor.jpg",
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//             )
//           : PreferredSize(
//               preferredSize: const Size.fromHeight(70),
//               child: AppBar(
//                 backgroundColor: Colors.transparent,
//                 elevation: 0.0,
//                 title: Shimmer.fromColors(
//                   baseColor: Colors.grey.shade400,
//                   highlightColor: Colors.grey.shade200,
//                   child: Container(
//                     height: 30.0,
//                     width: 200.0, // Adjust width according to your title length
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.grey.shade500.withOpacity(.5),
//                     ),
//                   ),
//                 ),
//                 actions: [
//                   Shimmer.fromColors(
//                     baseColor: Colors.grey.shade400,
//                     highlightColor: Colors.grey.shade200,
//                     child: Container(
//                       height: 80,
//                       width: 55,
//                       decoration: BoxDecoration(
//                           color: Colors.grey.shade500.withOpacity(.5),
//                           borderRadius: BorderRadius.circular(100)),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                 ],
//               ),
//             ),
//       body: (tempList.isNotEmpty)
//           ? ScrollConfiguration(
//               behavior: ScrollBehavior().copyWith(
//                 overscroll: false,
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 50,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 12, right: 12),
//                           child: ScrollablePositionedList.builder(
//                             itemScrollController: itemScrollController,
//                             shrinkWrap: true,
//                             physics: BouncingScrollPhysics(),
//                             itemCount: mealList.length,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, ind) {
//                               return methodlist(ind);
//                             },
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: CupertinoTextField(
//                           onChanged: (value) {
//                             setState(() {
//                               tempind = 0;
//                               print("tempind :: $tempind");
//                               print("val : $value");
//                               if (tempList.isNotEmpty) {
//                                 ApiList = tempList
//                                     .where((element) => element['name']
//                                         .toString()
//                                         .toLowerCase()
//                                         .contains(
//                                             value.toString().toLowerCase()))
//                                     .toList();
//                               }
//                             });
//                           },
//                           style: TextStyle(
//                             color: Colors.white60,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade500.withOpacity(.3),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           padding: EdgeInsets.all(15),
//                           cursorWidth: 2,
//                           cursorRadius: Radius.circular(10),
//                           cursorColor: Colors.white38,
//                           cursorOpacityAnimates: true,
//                           prefix: Padding(
//                             padding: const EdgeInsets.only(left: 15.0),
//                             child: Icon(
//                               CupertinoIcons.search,
//                               color: Colors.white60,
//                               size: 20,
//                             ),
//                           ),
//                           placeholder: "Find your favorite recipe...",
//                           placeholderStyle: TextStyle(
//                             color: Colors.white60,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0),
//                         child: Text(
//                           "${ApiList.length} new recipes",
//                           style: TextStyle(
//                               color: const Color(0xeacb991c).withOpacity(.6),
//                               fontSize: 25,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 20.0, right: 20, bottom: 20),
//                           child: ScrollConfiguration(
//                             behavior:
//                                 ScrollBehavior().copyWith(overscroll: false),
//                             child: GridView.builder(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: ApiList.length,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2,
//                                       mainAxisSpacing: 18,
//                                       crossAxisSpacing: 12,
//                                       childAspectRatio: MediaQuery.of(context)
//                                               .size
//                                               .width /
//                                           (MediaQuery.of(context).size.height -
//                                               330)),
//                               itemBuilder: (context, index) {
//                                 return Gridmethod1(index);
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ]),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.only(
//                   top: 18.0, bottom: 18, left: 8, right: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Container(
//                     height: 50,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 4, // Replace this with your actual itemCount
//                       itemBuilder: (BuildContext context, int index) {
//                         return Shimmer.fromColors(
//                           baseColor: Colors.grey.shade400,
//                           highlightColor: Colors.grey.shade200,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               height: 35,
//                               width: 70,
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.shade500.withOpacity(.5),
//                                   borderRadius: BorderRadius.circular(25)),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Shimmer.fromColors(
//                       baseColor: Colors.grey.shade400,
//                       highlightColor: Colors.grey.shade200,
//                       child: Container(
//                         height: 40.0,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.shade500.withOpacity(.5),
//                             borderRadius: BorderRadius.circular(25)),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: GridView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 18,
//                             crossAxisSpacing: 12,
//                             childAspectRatio:
//                                 MediaQuery.of(context).size.width /
//                                     (MediaQuery.of(context).size.height - 420)),
//                         itemCount: 6, // Replace this with your actual itemCount
//                         itemBuilder: (BuildContext context, int index) {
//                           return Shimmer.fromColors(
//                             baseColor: Colors.grey.shade400,
//                             highlightColor: Colors.grey.shade200,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade500.withOpacity(.5),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
//
//   Widget Gridmethod1(int index) {
//     final _ratingController = TextEditingController();
//     double rating = double.parse("${ApiList[index]['rating']}");
//
//     return InkWell(
//       borderRadius: BorderRadius.circular(20),
//       onTap: () {
//         Navigator.pushReplacement(context, CupertinoPageRoute(
//           builder: (context) {
//             return detailsClass(IndexMap: ApiList[index], rateing: rating);
//           },
//         ));
//       },
//       child: StatefulBuilder(
//         builder: (BuildContext context, setState1) {
//           return Stack(
//             children: [
//               Container(
//                 height: 210,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       bottomRight: Radius.circular(20),
//                       bottomLeft: Radius.circular(20)),
//                   color: Colors.grey.shade500.withOpacity(.30),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 8),
//                       child: Text(
//                         "${ApiList[index]["name"]}",
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           color: Colors.white70,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     GFRating(
//                       color: const Color(0xeacb991c),
//                       borderColor: const Color(0xeacb991c),
//                       value: rating,
//                       size: 15,
//                       allowHalfRating: true,
//                       controller: _ratingController,
//                       onChanged: (value) {
//                         setState1(() {
//                           rating = value;
//                         });
//                       },
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           CupertinoIcons.stopwatch,
//                           color: Colors.white60,
//                           size: 20,
//                         ),
//                         const SizedBox(width: 5),
//                         Text(
//                           "${ApiList[index]["prepTimeMinutes"]} min",
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             color: Colors.white70,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 right: -20,
//                 top: -20,
//                 child: Container(
//                   height: 130,
//                   width: 130,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image.network(
//                       "${ApiList[index]['image']}",
//                       filterQuality: FilterQuality.high,
//                       fit: BoxFit.fill,
//                       height: 130,
//                       width: 130,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) {
//                           return child;
//                         } else {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.white12,
//                               strokeWidth: 2.4,
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                       loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget methodlist(int ind) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, bottom: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           InkWell(
//             radius: 20,
//             borderRadius: BorderRadius.circular(20),
//             onTap: () {
//               setState(() {
//                 print("temind = $tempind");
//                 print("ind = $ind");
//                 itemScrollController.scrollTo(
//                     index: ind, duration: Duration(milliseconds: 1500));
//                 tempind = ind;
//
//                 if (tempind == 0) {
//                   ApiList = List.from(tempList);
//                 } else {
//                   if (mealList.isNotEmpty) {
//                     ApiList = tempList
//                         .where((element) => element['tags']
//                             .toString()
//                             .toLowerCase()
//                             .contains(mealList[ind].toString().toLowerCase()))
//                         .toList();
//                     setState(() {});
//                   }
//                 }
//                 print("temind = $tempind");
//                 print("ind = $ind");
//               });
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8),
//               child: Text(
//                 "${mealList[ind]}",
//                 style: TextStyle(
//                   color: (ind == tempind) ? Colors.white70 : Colors.white38,
//                   fontSize: 18,
//                   fontWeight:
//                       (ind == tempind) ? FontWeight.w500 : FontWeight.w400,
//                 ),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 2,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 8),
//             child: Container(
//               height: (ind == tempind) ? 2.5 : 0,
//               width: (ind == tempind) ? 15 : 0,
//               decoration: (ind == tempind)
//                   ? BoxDecoration(
//                       color: Color(0xff2F7C2c),
//                       borderRadius: BorderRadius.circular(5))
//                   : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
