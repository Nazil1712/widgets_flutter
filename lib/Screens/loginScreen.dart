import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/rond_button.dart';
import 'SignupScreen.dart';
import 'container_page.dart';
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {


  final _formKey=GlobalKey<FormState>();//for formkey use for validation
  final emailController=TextEditingController();//to store value of email textbox
  final pwdController=TextEditingController();
  final _auth=FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //for exiting from app

    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(

          title: Text('Login'),
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
                      ],
                    )),
                const SizedBox(height: 50,),

                ElevatedButton(style: buttonPrimary,

                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        //function call
                        login();

                      }

                    },
                    child: Text("Login",style: TextStyle(color: Colors.white),)),


                //button for login

                const SizedBox(height: 50,),
                Row(
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                    }, child: Text("Sign up",style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold)))
                  ],
                ),
                const SizedBox(height: 30,),
                // Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(20))
                //     ),
                //     child: Center(child: ElevatedButton(
                //         onPressed: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneAuthForm()));
                //         },
                //         child:
                //         Text("Login with phone"))))


              ],
            ),
          ),
        ),
      ),
    );
  }
  void login(){
    //login method
    _auth.signInWithEmailAndPassword(email: emailController.text.toString(),
        password: pwdController.text.toString()).then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BuildListAllScreen()));
    }).onError((error, stackTrace){
      var snackBar = SnackBar(content: Text("This User Is Not Authenticated"));
      // Step 3
      ScaffoldMessenger.of(context).showSnackBar(snackBar);



    });


  }

}