import 'package:first_project/area.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UtFOR'.toString()),
        ),
        backgroundColor: Colors.blue[50],
        body: SafeArea(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: const <Widget>[
                              Text(
                                "Olá",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black45),
                              ),
                              Text("Bem Vindo",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const CircleAvatar(
                            radius: 35,
                          )
                        ],
                      )),
                  //Barra Pesquisa
                  Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      // ignore: prefer_const_constructors
                      child: TextField(
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            // ignore: prefer_const_constructors
                            contentPadding: EdgeInsets.only(
                              left: 20,
                              top: 15,
                              right: 20,
                              bottom: 15,
                            ),
                            // ignore: prefer_const_constructors
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              // ignore: prefer_const_constructors
                              child: CircleAvatar(
                                child: Icon(Icons.search),
                              ),
                            ),
                            hintText: "Pesquisar",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  //Circulos de opções
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width - 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              // ignore: prefer_const_constructors
                              return Padding(
                                  padding: EdgeInsets.only(left: 15, top: 15),
                                  // ignore: prefer_const_constructors
                                  child: CircleAvatar(
                                    radius: 43,
                                    backgroundColor:
                                        Color.fromARGB(255, 20, 20, 20),
                                    child: InkWell(onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Area()));
                                    }
                                        // onPressed (){
                                        // Navigator.push(
                                        //  context,
                                        //  MaterialPageRoute(
                                        //    builder: BuildContext context) => Area())};
                                        ),
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                // ignore: prefer_const_constructors
                                return Padding(
                                  // ignore: prefer_const_constructors
                                  padding: EdgeInsets.only(left: 15, top: 15),
                                  // ignore: prefer_const_constructors
                                  child: CircleAvatar(
                                    radius: 43,
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        children: <Widget>[
                          // ignore: sized_box_for_whitespace
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                // ignore: prefer_const_constructors
                                return Padding(
                                  // ignore: prefer_const_constructors
                                  padding: EdgeInsets.only(left: 15, top: 15),
                                  // ignore: prefer_const_constructors
                                  child: CircleAvatar(
                                    radius: 43,
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
