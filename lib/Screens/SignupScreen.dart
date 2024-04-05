import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/rond_button.dart';
import 'loginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  final _formKey=GlobalKey<FormState>();
  FirebaseAuth _auth=FirebaseAuth.instance;
  //controllers
  final usernameController=TextEditingController();
  final emailController=TextEditingController();
  final pwdController=TextEditingController();
  final conpwdController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue,Colors.red]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // TextFormField(
                      //   keyboardType: TextInputType.text,
                      //   controller:usernameController ,
                      //   decoration: const InputDecoration(
                      //       hintText: "Username",
                      //       //helperText: 'Enter e.g.name123',
                      //       suffixIcon: Icon(Icons.person)
                      //   ),
                      //   validator: (value){
                      //     if(value!.isEmpty){
                      //       return 'enter Username';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller:emailController ,
                        decoration: const InputDecoration(
                            hintText: "Email",
                            //helperText: 'Enter e.g.name@gmail.com',
                            suffixIcon: Icon(Icons.email)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }else
                            return null;
                        },
                      ),

                      Container(
                        height: 20,

                      ),

                      TextFormField(
                        keyboardType: TextInputType.text,

                        controller:pwdController ,
                        obscureText: true,
                        decoration: const InputDecoration(

                            hintText: "Password",
                            //helperText: 'Enter Password',
                            suffixIcon: Icon(Icons.lock)
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'enter Password';
                          }else if(value.length<6){
                            return 'Password must be atleast 6 character';

                          }
                          return null;
                        },
                      ),
                      Container(
                        height: 20,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,

                        controller:conpwdController ,
                        obscureText: true,
                        decoration: const InputDecoration(

                            hintText: "Confirm Password",
                            //helperText: 'Enter Password',
                            suffixIcon: Icon(Icons.security)
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'enter Password';
                          }else if(value!!=pwdController.text.toString()){
                            return 'Password not match';
                          }
                          return null;
                        },
                      ),

                    ],
                  )),
              const SizedBox(height: 50,),
              ElevatedButton(style: buttonPrimary,
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      //function call
                      Signup();

                    }
                  },
                  child: Text("Sign up",style: TextStyle(color: Colors.white),)),
              //Signup button

              const SizedBox(height: 50,),
              Row(
                children: [
                  Text("Already have an account"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginScreen()));
                  }, child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),))
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
  void Signup(){
    //circular round on button jusr for it nothing else

    _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: pwdController.text.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginScreen()));

  }


}


