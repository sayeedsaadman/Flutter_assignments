import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: 'assignment 2',
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Photo Gallery")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Welcome to My Photo Gallery!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search for photo..",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Image clicked"),
                      ),
                    );
                  },
                    child: Column(
                      children: [
                        Image.network(
                          "https://th.bing.com/th/id/R.9b0b8859a140a9b61a29ae73850dd420?rik=mGpBFISO2drkiA&pid=ImgRaw&r=0",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Photo ${index + 1}"),
                        ),
                      ],
                    ),
                );
              },
            ),
            ListTile(
              title: Text("Photo 1"),
              subtitle: Text("description about photo 1"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://th.bing.com/th/id/R.9b0b8859a140a9b61a29ae73850dd420?rik=mGpBFISO2drkiA&pid=ImgRaw&r=0'),
              ),
            ),
            ListTile(
              title: Text("Photo 2"),
              subtitle: Text("description about photo 2"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://th.bing.com/th/id/R.9b0b8859a140a9b61a29ae73850dd420?rik=mGpBFISO2drkiA&pid=ImgRaw&r=0'),
              ),
            ),
            ListTile(
              title: Text("Photo 3"),
              subtitle: Text("description about photo 3"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://th.bing.com/th/id/R.9b0b8859a140a9b61a29ae73850dd420?rik=mGpBFISO2drkiA&pid=ImgRaw&r=0'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Photos Uploaded !"),
                  ),
                );
              },
                child: Center(
                  child: Icon(
                    Icons.upload,
                    size: 40,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

