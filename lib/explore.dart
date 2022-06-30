// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'appbar.dart';
import 'ec.dart';
import 'ec_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _searchController = TextEditingController();
  List<EC> sportECs = sports;
  List<EC> clubECs = clubs;
  List<EC> clubECs2 = clubs2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: buildAppBar(context)
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[


              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: TextField(
                  onChanged: searchECs,
                  controller: _searchController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade700),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Extracurricular Activities',
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.grey[300],
                      filled: true),
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 20,),


                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState((){;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          width: (MediaQuery.of(context).size.width/3.5),
                          height: (MediaQuery.of(context).size.width/5),
                          child: Container(
                              padding: EdgeInsets.all(12),
                              //  width: SizeConfig.screenWidth * 0.78,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.orange[200],
                              ),
                              child: Image.asset("images/vest.png")

                          ),
                        ),
                      ),

                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Text("Volunteer", style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 10,),
                        ],
                      )

                    ],
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState((){;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          width: (MediaQuery.of(context).size.width/3.5),
                          height: (MediaQuery.of(context).size.width/5),
                          child: Container(
                              padding: EdgeInsets.all(12),
                              //  width: SizeConfig.screenWidth * 0.78,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.orange[200],
                              ),
                              child: Image.asset("images/trophy.png")

                          ),
                        ),
                      ),

                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Text("Competitions", style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,

                          ),),
                          SizedBox(width: 10,)
                        ],
                      )

                    ],
                  ),


                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState((){;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          width: (MediaQuery.of(context).size.width/3.5),
                          height: (MediaQuery.of(context).size.width/5),
                          child: Container(
                              padding: EdgeInsets.all(12),
                              //  width: SizeConfig.screenWidth * 0.78,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.orange[200],
                              ),
                              child: Image.asset("images/graduation.png")

                          ),
                        ),
                      ),

                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Text("College Prep", style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 10,)
                        ],
                      )

                    ],
                  ),


                ],
              ),

              Divider(
                color: Colors.blue,
                thickness: 1,
              ),
              SizedBox(height: 15),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  const Text(
                    'Sports',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              //SizedBox(height: 1, width: 50),

              Container(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: sportECs.length,
                  separatorBuilder: (context, _) => SizedBox(width: 0),
                  itemBuilder: (context, index) =>
                      buildCard(item: sportECs[index]),
                ),
              ),
              //SizedBox(height: 15),

              Divider(
                color: Colors.blue,
                thickness: 1,
              ),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  const Text(
                    'Clubs',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              //SizedBox(height: 15),
              Column(
                children: [
                  Container(
                    height: 135,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: clubECs.length,
                      separatorBuilder: (context, _) => SizedBox(width: 0),
                      itemBuilder: (context, index) =>
                          buildCard(item: clubECs[index]),
                    ),
                  ),
                  //SizedBox(height: 20),
                  Container(
                    height: 135,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: clubECs2.length,
                      separatorBuilder: (context, _) => SizedBox(width: 0),
                      itemBuilder: (context, index) =>
                          buildCard(item: clubECs2[index]),
                    ),
                  ),
                ],
              ),

              Divider(
                color: Colors.blue,
                thickness: 1,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required EC item,
  }) =>
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.blueGrey.withOpacity(0.3),
        //       spreadRadius: 3,
        //       blurRadius: 3,
        //       offset: Offset(0, 2), // changes position of shadow
        //     ),
        //   ],
        //   // border: Border.all(
        //   //   width: .0,
        //   //   color: Colors.blue,
        //   // ),
        //   borderRadius: BorderRadius.circular(25),
        //   color: Colors.white54,
        // ),
        width: 160,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 3.5 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    child: Ink.image(
                      image: NetworkImage(item.urlImage),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ECPage(ec: item),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );

  void searchECs(String query) {
    final suggestions = sports.where((EC) {
      final ECTitle = EC.title.toLowerCase();
      final input = query.toLowerCase();

      return ECTitle.contains(input);
    }).toList();

    setState(() => sportECs = suggestions);

    final suggestions2 = clubs.where((EC) {
      final ECTitle = EC.title.toLowerCase();
      final input = query.toLowerCase();

      return ECTitle.contains(input);
    }).toList();

    setState(() => clubECs = suggestions2);

    final suggestions3 = clubs2.where((EC) {
      final ECTitle = EC.title.toLowerCase();
      final input = query.toLowerCase();

      return ECTitle.contains(input);
    }).toList();

    setState(() => clubECs2 = suggestions3);
  }
}
