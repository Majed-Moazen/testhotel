import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hotel_test/dio.dart';

class Home extends StatefulWidget {
  Home({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  State<Home> createState() => _HomeState();
}

bool loding = false;

class _HomeState extends State<Home> {
  double priceSlider = 540;

  var sortText = [
    'Our recommendations',
    'Rating & Recommended',
    'Price & Recommended',
    'Distance & Recommended',
    'Rating only',
    'Price only',
    'Distance only'
  ];

  List<bool> check=List.generate(7, (index) {

   if(index==0)return true;
   else
     return false;
  });

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  var data;

  @override
  Widget build(BuildContext context) {
    if (data == null)
      dioclass.get('hotels').then((value) {
        setState(() {
          loding = true;
          data = value!.data;
        });
      }).catchError((e) {
        print(e);
      });
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          height: 40,
          child: Image.asset(
            'assets/map.jpg',
            height: 35,
          )),
      appBar: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: AppBar(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Container(width: 30,height: 30,child: Image.asset('assets/filter.jpg')),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            context: context,
                            builder: (b) {
                              return StatefulBuilder(
                                builder: (c, setState) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AppBar(
                                            elevation: 3,
                                            shape: ContinuousRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20))),
                                            leadingWidth: 150,
                                            centerTitle: true,
                                            backgroundColor: Colors.white,
                                            leading: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, top: 15),
                                              child: Text('Reset',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .underline)),
                                            ),
                                            title: Text('Filters',
                                                style: TextStyle(
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                            actions: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  color: Colors.black,
                                                  icon: Icon(Icons.close),
                                                ),
                                              )
                                            ]),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('PRICE PER NIGHT'),
                                                    Container(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .all(8),
                                                        child: Text(
                                                            '${priceSlider.toInt()}+ \$'),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                                  ],
                                                ),
                                                Slider(
                                                    thumbColor: Colors.white,
                                                    activeColor: Colors.blue,
                                                    onChangeEnd: (value) {
                                                      setState(() {});
                                                    },
                                                    value: priceSlider,
                                                    min: 20,
                                                    max: 540,
                                                    label: 'mm',
                                                    onChanged: (value) {
                                                      priceSlider = value;
                                                      setState(() {});
                                                    }),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 30.0,
                                                          left: 30,
                                                          right: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('\$20',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                      Text('\$540+',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  ),
                                                ),
                                                Text('RATING'),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Center(
                                                            child: Text('0+',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color: Colors.red),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Center(
                                                            child: Text('7+',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                Colors.orange),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Center(
                                                            child: Text('7.5+',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color: Colors
                                                                .lightGreen),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Center(
                                                            child: Text('8+',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Center(
                                                            child: Text('8.5+',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color: Colors.green
                                                                .shade900),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: Text('HOTEL CLASS'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Image.asset(
                                                            'assets/star1.PNG'),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .amber),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Image.asset(
                                                            'assets/star2.PNG'),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .amber),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Image.asset(
                                                            'assets/star3.PNG'),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .amber),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Image.asset(
                                                            'assets/star4.PNG'),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .amber),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Container(
                                                        width: 35,
                                                        height: 35,
                                                        child: Image.asset(
                                                            'assets/star5.PNG'),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .amber),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: Text('DISTANCE FROM'),
                                                ),
                                                Container(
                                                  color: Colors.grey,
                                                  height: 1,
                                                  width: double.infinity,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Location'),
                                                      Text(
                                                        'City center >',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.grey,
                                                  height: 1,
                                                  width: double.infinity,
                                                ),
                                              ]),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsetsDirectional.symmetric(
                                                  horizontal: 20, vertical: 10),
                                          width: double.infinity,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2,
                                                )
                                              ]),
                                          child: MaterialButton(
                                            color: Colors.blue,
                                            onPressed: () {},
                                            child: Text('Show results',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Text(
                        'Filters',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(width: 30,height: 30,child: Image.asset('assets/sort.jpg')),

                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            context: context,
                            builder: (b) {
                              return StatefulBuilder(
                                builder: (c, setState) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AppBar(
                                            elevation: 3,
                                            shape: ContinuousRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20))),
                                            leadingWidth: 150,
                                            centerTitle: true,
                                            backgroundColor: Colors.white,
                                            title: Text('Sort by',
                                                style: TextStyle(
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                            actions: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  color: Colors.black,
                                                  icon: Icon(Icons.close),
                                                ),
                                              )
                                            ]),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical:  20.0,horizontal: 10),
                                          child:  ListView.separated(

                                            physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (c, i) {
                                                return InkWell(
                                                  onTap: () {
                                                    isSelect(i);
                                                    setState((){});
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('${sortText[i]}'),
                                                    check[i]?Icon(Icons.check,color: Colors.blue):Container(),
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (c, i) {
                                                return Container(
                                                  margin: EdgeInsetsDirectional.symmetric(vertical:20),
                                                    height: 1,
                                                    color: Colors.grey,
                                                    width: double.infinity);
                                              },
                                              itemCount: 7),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Text(
                        'Sort',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                )),
          ),
          preferredSize: Size.fromHeight(50)),
      body: loding
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsetsDirectional.all(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ]),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Image(
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                              height: 120,
                              image: NetworkImage(data[i]['image']),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                child: FaIcon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 13, bottom: 5),
                          child: Row(
                            children: [
                              star(data[i]['starts']),
                              Text(
                                ' Hotel',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            '${data[i]['name']}',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(start: 15),
                              padding: EdgeInsetsDirectional.only(
                                top: 2.5,
                              ),
                              child: Text('${data[i]['review_score']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              width: 40,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade800,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Text(' ${data[i]['review']}  '),
                            Icon(
                              Icons.location_pin,
                              color: Colors.grey,
                              size: 15,
                            ),
                            Text('  ${data[i]['address']}'),
                          ],
                        ),
                        Container(
                          child: Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('Our lowest price',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center),
                                      padding:
                                          EdgeInsetsDirectional.only(top: 3),
                                      width: 130,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.cyan.shade100,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('\$',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text('${data[i]['price']}',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text('Renaissance'),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'View Deal',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            ],
                          ),
                          margin: EdgeInsetsDirectional.all(10),
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'More prices',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
void isSelect( int index)
  {

    check=List.generate(7, (index) => false);
    check[index]=true;

  }
  Widget star(int i) {
    List<Widget> starts = List.generate(
        i,
        (index) => Icon(
              Icons.star,
              color: Colors.grey,
              size: 12,
            ));
    return Row(
      children: starts,
    );
  }
}
