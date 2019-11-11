import 'package:flutter/material.dart';
import 'package:flutter_cocktail/details.dart';

import 'Provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cocktailData = [];
  bool isLoading = false;
  bool isShowAsList = false;
  // *********************init ********************
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    CocktailProvider().getCoctailRecords().then((value) {
      this.setState(() {
        this.cocktailData = value;
        this.isLoading = false;
      });
    });
  }
  // *********************init ********************

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.brown, Colors.orange[100]])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Cocktail"),
            centerTitle: true,
            elevation: 1.0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Hero(
                tag: "listButton",
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowAsList = !isShowAsList;
                    });
                  },
                  icon: isShowAsList ? Icon(Icons.list) : Icon(Icons.grid_on),
                ),
              )
            ],
          ),
          body: Container(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  )
                : isShowAsList
                    ? ListView.builder(
                        itemCount: cocktailData.length,
                        itemBuilder: (context, index) {
                          return Hero(
                              tag: cocktailData[index],
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          fullscreenDialog: true,
                                          builder: (context) => Datails(
                                              id: cocktailData[index]
                                                  ["idDrink"],
                                              title: cocktailData[index]
                                                  ["strDrink"],
                                              image: cocktailData[index]
                                                  ["strDrinkThumb"])));
                                },
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    cocktailData[index]["strDrinkThumb"] == null
                                        ? "https://ngoclb.com/wp-content/uploads/2019/01/broken-1.png"
                                        : cocktailData[index]["strDrinkThumb"],
                                  ),
                                ),
                                title:
                                    Text("${cocktailData[index]["strDrink"]}"),
                                subtitle:
                                    Text("${cocktailData[index]["idDrink"]}"),
                              ));
                        },
                      )
                    : GridView.builder(
                        itemCount: cocktailData.length,
                        itemBuilder: (context, index) {
                          return Hero(
                            tag: cocktailData[index],
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Datails(
                                            id: cocktailData[index]["idDrink:"],
                                            title: cocktailData[index]
                                                ["strDrink"],
                                            image: cocktailData[index]
                                                ["strDrinkThumb"])));
                              },
                              child: Card(
                                child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xFFD3D3D3),
                                              spreadRadius: 5.0),
                                        ],
                                        border: Border.all(
                                            style: BorderStyle.none,
                                            width: 0.0,
                                            color: Colors.transparent),
                                        image: DecorationImage(
                                            image: NetworkImage(cocktailData[
                                                            index]
                                                        ["strDrinkThumb"] ==
                                                    null
                                                ? "https://ngoclb.com/wp-content/uploads/2019/01/broken-1.png"
                                                : cocktailData[index]
                                                    ["strDrinkThumb"]),
                                            fit: BoxFit.fill)),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                          color: Color.fromRGBO(0, 0, 0, 0.7),
                                          padding: EdgeInsets.all(12.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Wrap(
                                              children: <Widget>[
                                                Text(
                                                  cocktailData[index]
                                                      ["strDrink"],
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )),
                                    )),
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4),
                      ),
          )),
    );
  }
}
