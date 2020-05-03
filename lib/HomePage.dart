import 'package:drawer/burgerPage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>{
 
  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, color: Colors.black),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0),
                      ),
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/tuxedo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text("SEARCH FOR",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text("RECIPIES",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.only(top:5.0,left: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 20.0),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(.5),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Recommended",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem('Hamburg', 'assets/burger.png', '21', Color(0xFFFFE90A),Color(0xFF6A5CAA)),
                _buildListItem('Chips', 'assets/fries.png', '15', Color(0xFFC2E3FE),Color(0xFF6A8CAA)),
                _buildListItem('Donuts', 'assets/doughnut.png', '15', Color(0xFFD7FADA),Color(0xFF56CC7E)),
                _buildListItem('taco', 'assets/taco.png', '10', Color(0xFFD2A2FE),Color(0xFF6A8CAA)),
                _buildListItem('Pizza', 'assets/pizza.png', '20', Color(0xFFFFC50A),Color(0xFF6A5CAA)),
                _buildListItem('PopCorn', 'assets/popcorn.png', '10', Color(0xFFD2A2FE),Color(0xFF6A8CAA)),
                _buildListItem('Donut', 'assets/hotdog.png', '20', Color(0xFFFFC50A),Color(0xFF6A5CAA)),
                _buildListItem('sandwitch', 'assets/sandwich.png', '60', Color(0xFFD7FCAA),Color(0xFF56CC7E)),
              ],
            ),
          ),
          SizedBox(height:20),
        ],
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: (){
          setState(() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BurgerPage(heroTag: foodName,imgPath: imgPath,foodName: foodName,pricePerItem: price)));
          });
        },
        child: Container(
          height: 175.0,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: bgColor.withOpacity(.4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: foodName,
                child: Container(
                  height:75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(imgPath,height: 50.0,width: 50.0,),
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Text(foodName,
              style: TextStyle(
                fontSize: 17.0,
                color: textColor,
              ),
            ),
             Text('\$' + price,
              style: TextStyle(
                fontSize: 17.0,
                color: textColor,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
