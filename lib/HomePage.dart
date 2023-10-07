import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List photo = [
    {
      "img":
      "https://th.bing.com/th/id/R.b6b807be147220c714f25ba9b81825d1?rik=RR%2bjzJ8%2bVnQBtg&pid=ImgRaw&r=0",
      "title": "Jacket",
      "color": "Black",
      "Size": "XL",
      "Price": "20",
      "count": 0,
    },
    {
      "img":
      "https://th.bing.com/th/id/OIP._BG8WHUQoU6WXhtnO3dMvQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7",
      "title": "T-Shirt",
      "color": "Yellow",
      "Size": "L",
      "Price": "5",
      "count": 0,
    },
    {
      "img":
      "https://th.bing.com/th/id/OIP.xdhJhdbLqcfHvzlFkGPMqgHaLG?w=127&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7",
      "title": "Track suit",
      "color": "Black & Red",
      "Size": "XL",
      "Price": "30",
      "count": 0,
    },
  ];
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 10),
            child: Icon(Icons.search,color: Colors.black,),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 10),
              child: Text("My Bag",style: TextStyle(color:
              Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: photo.length,
                itemBuilder: (context, index) {
                  int itemTotal =
                  (int.parse(photo[index]["Price"]) * photo[index]["count"])
                      .toInt();
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                    image: DecorationImage(
                                        image: NetworkImage(photo[index]["img"],),fit: BoxFit.cover
                                    )
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 5, top: 8, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                photo[index]["title"],
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "Colors: ",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                          TextSpan(
                                              text: "${photo[index]["color"]}",
                                              style:
                                              TextStyle(color: Colors.grey))
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "Size: ",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                          TextSpan(
                                              text: "${photo[index]["Size"]}",
                                              style:
                                              TextStyle(color: Colors.grey))
                                        ]),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ]),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (photo[index]["count"] > 0) {
                                              photo[index]["count"]--;
                                              totalAmount -= int.parse(
                                                  photo[index]["Price"]);
                                            }
                                          });
                                        },
                                        child: Icon(Icons.remove)),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Container(
                                    child: Text("${photo[index]["count"]}"),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ]),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            photo[index]["count"]++;
                                            totalAmount +=
                                                int.parse(photo[index]["Price"]);
                                          });
                                        },
                                        child: Icon(Icons.add)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12, top: 10, bottom: 5),
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '${photo[index]["Price"]}\$',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Total Amount:",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "${totalAmount}\$",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        final message = SnackBar(content: Text("Congratulation"));
                        ScaffoldMessenger.of(context).showSnackBar(message);
                      },
                      child: Text(
                        "CHECK OUT",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}