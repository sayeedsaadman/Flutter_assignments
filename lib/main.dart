import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context)
  {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600)
        {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: mediaQuery.height * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.xH57nyAVNcD9cKPzuNlIOwD6D6?w=186&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7"),)),
                ),
              ),
              Text(
                "Sayeed Saadman",
                style: TextStyle(fontSize: 24,),),
              SizedBox(height: 5,),Padding(padding: const EdgeInsets.all(8.0),
                child: Text(
                  "any any any any any any any any",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.10),
                    itemBuilder: (context, index)
                    {
                      return Container(
                          child: Image.network("https://th.bing.com/th/id/OIP.xH57nyAVNcD9cKPzuNlIOwD6D6?w=186&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7",),
                      );
                    }),
              )
            ],
          );
        } else {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: mediaQuery.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://th.bing.com/th/id/OIP.xH57nyAVNcD9cKPzuNlIOwD6D6?w=186&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7",),
                          fit: BoxFit.cover),),
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Jhon Doe",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Cartoon hi text using marvel effect etc etc",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 15,),
                    Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 9,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.10

                          ), itemBuilder: (context, index){
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                            child: Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fcomic&psig=AOvVaw19nfYL_C4JFYmmlNCoZr44&ust=1696176349677000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOif7bfb0oEDFQAAAAAdAAAAABAE",fit: BoxFit.cover,),
                        );
                      }),
                    )

                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }
}

