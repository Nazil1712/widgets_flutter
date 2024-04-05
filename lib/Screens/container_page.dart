import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:widgets/Screens/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyBJnAmLmt6ReIPQlvECbxwznRTE1gBWqGw ", appId: "1:601320217699:android:5967ee004583634a63ac56", messagingSenderId: "601320217699", projectId: "dbwidgets-15225")
  );

  runApp(basicwidgets());
}
class basicwidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),textTheme: GoogleFonts.openSansTextTheme(
        Theme.of(context).textTheme,
      ),),


      debugShowCheckedModeBanner: false,
      title: "Container Page",
      home: AnimatedSplashScreen(
        splash: 'assets/logoWhiteBcg.jpg',
        splashIconSize: 125,
        nextScreen : loginScreen(),
        splashTransition: SplashTransition.sizeTransition,
      ),
    );

  }

}

class BuildListAllScreen extends StatelessWidget {
  final List<String> image=["assets/mustakim.jpg","assets/m3.jpg","assets/m4.jpg","assets/m5.jpg"];

  var arrRouteName=["Row Column","Image Screen","BuildListScreen","ListScreen","ContainerScreen","DataInputScreen","textBTNScreen","elevBTNScreen","outBTNScreen"];
  final List<Widget> pages=[Row_Column(),imageScreen(),BuildListScreen(),ListScreen(),ContainerScreen(),DataInputScreen(),textBTNScreen(),elevBTNScreen(),outBTNScreen()];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("All  Widgets",style: TextStyle(fontWeight: FontWeight.w900,),),
        centerTitle: false,




      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CarouselSlider(items: [Container(
            // color: Colors.white,
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                filterQuality: FilterQuality.high,
                image: AssetImage("assets/nazil.jpg"),
                fit: BoxFit.contain,

              ),
            ),
          ),

            //2nd Image of Slider
            Container(

              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(

                  filterQuality: FilterQuality.high,
                  image: AssetImage("assets/flag.jpeg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Container(
            //
            //   margin: EdgeInsets.all(6.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50.0),
            //     image: DecorationImage(
            //
            //       filterQuality: FilterQuality.high,
            //       image: AssetImage("assets/mudassir.jpg"),
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
            // Container(
            //
            //   margin: EdgeInsets.all(6.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50.0),
            //     image: DecorationImage(
            //
            //       filterQuality: FilterQuality.high,
            //       image: AssetImage("assets/farhan.jpg"),
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
            // Container(
            //
            //   margin: EdgeInsets.all(6.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50.0),
            //     image: DecorationImage(
            //
            //       filterQuality: FilterQuality.high,
            //       image: AssetImage("assets/manthan.jpg"),
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
          ], options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          )),
          Container(height: 250, child:ListView(children: [MyGridView()])),
          // Container(
          //   height: 250,
          //   color: Theme.of(context).colorScheme.background,
          //   // child: ListView.builder(itemBuilder: (context,index){
          //   //
          //   //   return Padding(
          //   //     padding: const EdgeInsets.all(8.0),
          //   //     child: ElevatedButton(onPressed: (){
          //   //       Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[index]));
          //   //     },
          //   //
          //   //       child: Text(arrRouteName[index],style:Theme.of(context).textTheme.bodyLarge ,
          //   //     )),
          //   //   );
          //   // },
          //   //   itemExtent: 100,
          //   //   itemCount: arrRouteName.length,),
          //
          // ),

        ],
      ),
    );
  }
}

class BuildListScreen extends StatelessWidget {
  var arrNames=["Mustakim","Sajid","Ruksana","Sufiyan","Fatima","Ismail","Zarina","Aadam","Piti"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(arrNames[index],style: Theme.of(context).textTheme.headlineSmall,),
        );

      },itemCount: arrNames.length,
        itemExtent: 100,
        ),

    );
  }

}
class ListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Widgets"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Mustakim",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sajid",style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Ruksana",style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sufiyan",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Fatima",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Ismail",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Zarina",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Aadam",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Altaf",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Imran",style: TextStyle(fontWeight: FontWeight.bold),),
          ),

        ],
      ),
    );
  }

}
class ContainerScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Dashboard"),
        centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(

        child: Container(
            alignment: Alignment.center,
          color: Colors.white,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: FloatingActionButton(
                      child: Text("Floating Button",style: Theme.of(context).textTheme.labelLarge),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>imageScreen()));},
                    ),
                  ),
                  TextButton(
                    child: Text("Text Button"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>textBTNScreen()));
                    },
                  ),

                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Elevated Button"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>elevBTNScreen()));
                    },
                  ),

                  OutlinedButton(
                    child: Text("Outline Button"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>outBTNScreen()));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DataInputScreen()));
                  }, child: Text("Data Input"))
                ],
              )

            ],
          )



        ),
      ),
    );
  }

}

class DataInputScreen extends StatelessWidget {
  var name=TextEditingController();
  var surname=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Data Input"),
      ),
      body: Center(
        child: Container(
          width: 250,

            child: Column(

              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11),borderSide: BorderSide(color: Colors.lightBlue),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "enter Name",
                        prefixIcon: Icon(Icons.person_2,color: Colors.red,)

                      ),
                    ),
                  ),
                ),
                 Container(
                   height: 20,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                     controller: surname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(11) ,borderSide: BorderSide(color: Colors.red)),
                      hintText: "Enter Surname",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.person,color: Colors.red,),
                        onPressed: (){},
                      )


                    ),
                                   ),
                 ),
                Container(
                  height: 20,
                ),

                Container(
                  child: OutlinedButton(onPressed: (){
                    String SName=name.text.toString();
                    String SurName=surname.text.toString();

                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: Text("Your First Name is $SName and Last Name is $SurName"),
                      );
                    });

                  }, child: Text("Show")),
                )
              ],
            ),
          ),
        ),


    );
  }
}
class imageScreen extends StatelessWidget{
  var arrImage=["assets/nazil.jpg","assets/flag.jpeg","assets/mustakim.jpg","assets/cake.jpeg","assets/ms2.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images"),
      ),
      body:  Center(
        child: Container(
          child: ListView.builder(itemBuilder: (context,index){
            scrollDirection: Axis.horizontal;


            return Image(image: AssetImage(arrImage[index]));
          },
          itemCount: arrImage.length,),
        ),
      )

    );
  }

}

class textBTNScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Button"),
      ),
      body: Center(
        child: TextButton(
          child: Text("Push Me"),
          onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Heyyy Brother!!"),
              content: Text("You clicked Text Button"),
            );

          });

          },
        ),
      )
    );
  }

}

 class elevBTNScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elevated Button"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("ElevatedButton"),
          onPressed: (){
showDialog(context: context, builder: (context){
  return AlertDialog(
    title: Text("Heyyy Human!!"),
    icon:Icon(Icons.person),
    content: Text("You clicked elevated Button"),
  );
})  ;        },
        ),
      ),
    );
  }

}


class outBTNScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Outline Button"),
      ),
      body: Center(
        child: Tooltip(
          message: 'Outline Button',
          child: OutlinedButton(
            child: Text("OutlinedButton clickes"),
            onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text("Heyyy Buddyyy!!"),
                  content: Text("You clicked Outline Button"),
                  icon: Icon(Icons.trending_up),
                );
              });

            },
          ),
        ),
      ),
    );
  }

}

class Row_Column extends StatefulWidget {
  const Row_Column({super.key});

  @override
  State<Row_Column> createState() => _Row_ColumnState();
}

class _Row_ColumnState extends State<Row_Column> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Column"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black12,
              child: Text(
                "Chocolate cake with chocolate sprinkles",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 22),
            Container(
              color: Colors.black12,
              child: Text(
                "A chocolate cake is a cake made with chocolate or cocoa.\nThe ingredients are put into a bowl and mixed together\nthen the mixed ingredients are put into a cake tin and put in an oven until it is fully cooked.\nThen the cake is taken out of the oven and placed on a cooling stand.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star_half),
                SizedBox(width: 20),
                Text(
                  "250 Reviews",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildColumn("Preparation", "+25 min"),
                buildColumn("Cook", "+1 hr"),
                buildColumn("Feed", "+40 min"),
              ],
            ),

            SizedBox(height: 20),
            Image(
              image: AssetImage("assets/cake.jpeg"),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColumn(String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.task, color: Colors.lightGreen.shade400),
        Text(title),
        Text(subtitle),
      ],
    );
  }
}

class MyGridView extends StatelessWidget {
  var arrRouteName=["Row Column","Image Screen","BuildListScreen","ListScreen","ContainerScreen","DataInputScreen","textBTNScreen","elevBTNScreen","outBTNScreen"];
  final List<Widget> pages=[Row_Column(),imageScreen(),BuildListScreen(),ListScreen(),ContainerScreen(),DataInputScreen(),textBTNScreen(),elevBTNScreen(),outBTNScreen()];


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 250,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: arrRouteName.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pages[index]),

                );
              },
              child: Card(
                color: Colors.white,
                borderOnForeground: true,

                child: Container(
                  color: Colors.black12, // You can set a background color if needed
                  child: Center(
                    child: Text(
                      arrRouteName[index],
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
    );

  }
}

