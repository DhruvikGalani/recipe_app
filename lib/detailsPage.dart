import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:reciepy_app/Itempage.dart';
import 'package:reciepy_app/Model/Model_reciepy.dart';

class detailsClass extends StatefulWidget {
  Map<String, dynamic> IndexMap;
  double rateing;
  detailsClass({required this.IndexMap, required this.rateing});

  @override
  State<detailsClass> createState() => _detailsClassState();
}

class _detailsClassState extends State<detailsClass> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    methodReciepy = MethodReciepy.fromJson(widget.IndexMap);
    init2();
  }

  void init2() {
    setState(() {
      desc = List.from(widget.IndexMap['instructions']);
      Indexrating = widget.rateing;
      print("rating : ${widget.rateing}");
    });
  }

  MethodReciepy? methodReciepy;

  final _ratingController = TextEditingController();
  late double Indexrating;
  List desc = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff080817),
      appBar: AppBar(
        backgroundColor: const Color(0xff080817),
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacement(context, CupertinoPageRoute(
            builder: (context) {
              return const ItemClass();
            },
          )),
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white70,
          ),
          splashRadius: 20,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.heart,
              size: 25,
              color: Colors.white70,
            ),
            splashRadius: 20,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(physics: BouncingScrollPhysics()),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, left: 15, right: 15, bottom: 15),
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.maxFinite,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        "${methodReciepy!.image}",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white12,
                                strokeWidth: 2.4,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
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
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xff080817).withOpacity(.7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.stopwatch,
                            color: Colors.white60,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "${methodReciepy!.prepTimeMinutes} min",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "${methodReciepy!.name}",
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, right: 20),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: desc.length,
                  itemBuilder: (context, ind) {
                    return Text(
                      "* ${desc[ind]}",
                      style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Row(
                children: [
                  const Text(
                    "Rating : ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  GFRating(
                    color: const Color(0xeacb991c),
                    borderColor: const Color(0xeacb991c),
                    value: Indexrating,
                    size: 20,
                    allowHalfRating: true,
                    controller: _ratingController,
                    onChanged: (value) {
                      setState(() {
                        print("object1  $Indexrating");
                        print("object1 === $value");
                        Indexrating = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "${Indexrating.toStringAsFixed(2)}",
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white60),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "MealType : ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 20),
                        child: Container(
                          height: 40,
                          child: ScrollConfiguration(
                            behavior: const ScrollBehavior()
                                .copyWith(overscroll: false),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: methodReciepy!.mealType!.length,
                              itemBuilder: (context, ind) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100
                                            .withOpacity(.20),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0,
                                          right: 6,
                                          top: 3,
                                          bottom: 3),
                                      child: Text(
                                        "${methodReciepy!.mealType![ind]}",
                                        style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Tags : ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 20),
                        child: Container(
                          height: 40,
                          child: ScrollConfiguration(
                            behavior: const ScrollBehavior()
                                .copyWith(overscroll: false),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: methodReciepy!.tags!.length,
                              itemBuilder: (context, ind) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100
                                            .withOpacity(.20),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0,
                                          right: 6,
                                          top: 3,
                                          bottom: 3),
                                      child: Text(
                                        "${methodReciepy!.tags![ind]}",
                                        style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Ingredients : ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 20),
                        child: Container(
                          height: 40,
                          child: ScrollConfiguration(
                            behavior: const ScrollBehavior()
                                .copyWith(overscroll: false),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: methodReciepy!.ingredients!.length,
                              itemBuilder: (context, ind) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100
                                            .withOpacity(.20),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0,
                                          right: 6,
                                          top: 3,
                                          bottom: 3),
                                      child: Text(
                                        "${methodReciepy!.ingredients![ind]}",
                                        style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Difficulty",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: DottedLine(
                        dashColor: Colors.white30,
                        dashLength: 2,
                        dashRadius: 100,
                      ),
                    ),
                  ),
                  Text(
                    "${methodReciepy!.difficulty}",
                    style: TextStyle(
                        color: Color(0xeacb991c).withOpacity(.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Cuisine",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: DottedLine(
                        dashColor: Colors.white30,
                        dashLength: 2,
                        dashRadius: 100,
                      ),
                    ),
                  ),
                  Text(
                    "${methodReciepy!.cuisine}",
                    style: TextStyle(
                        color: Color(0xeacb991c).withOpacity(.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Servings",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: DottedLine(
                        dashColor: Colors.white30,
                        dashLength: 2,
                        dashRadius: 100,
                      ),
                    ),
                  ),
                  Text(
                    "${methodReciepy!.servings}",
                    style: TextStyle(
                        color: Color(0xeacb991c).withOpacity(.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Calories/Serving",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: DottedLine(
                        dashColor: Colors.white30,
                        dashLength: 2,
                        dashRadius: 100,
                      ),
                    ),
                  ),
                  Text(
                    "${methodReciepy!.caloriesPerServing}",
                    style: TextStyle(
                        color: Color(0xeacb991c).withOpacity(.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
