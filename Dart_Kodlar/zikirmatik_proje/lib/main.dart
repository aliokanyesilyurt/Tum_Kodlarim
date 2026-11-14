import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulamam());
}

class Uygulamam extends StatefulWidget {
  const Uygulamam({super.key});

  @override
  State<Uygulamam> createState() => _UygulamamState();
}

class _UygulamamState extends State<Uygulamam> {
  
  int counter=0;

  void sayacArttir(){
    counter++;
    setState(() {  });
  }

  void sayacSifirla(){
    counter=0;
    setState(() {  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [Image.asset("assets/images/zikirmatik.png",width:300),
                Positioned(
                  bottom:25,
                  child: GestureDetector(
                    onTap: () => sayacArttir(),
                    child: Container(
                        width: 95,
                        height: 95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.blueGrey[200]
                        ),

                    ),
                  ),
                ),
                Positioned(
                  bottom: 115,
                  right: 75,
                  child: GestureDetector(
                    onTap: () => sayacSifirla(),
                    child: Container(
                      width: 30,
                      height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey
                    )
                    )
                  )
                ),
                Positioned(
                  top: 50,
                  child: Text("$counter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontFamily: "Arvo"
                    )
                    )
                  )
                ]
              ),
            ],
          )
        )
      ),
    );
  }
}