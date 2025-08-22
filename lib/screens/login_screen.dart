import 'dart:developer';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =TextEditingController();
    TextEditingController passwordController =TextEditingController();
    GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: loginFormKey,
          child: ListView(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (input){
                  if(input==""||input==null){
                    return "email is Required";
                  }else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "ex : email@email.com",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade800),
                  ),
                  prefixIcon: Icon(Icons.email_outlined,color:  Colors.grey,)
                  
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                validator: (input){
                  if(input==""||input==null){
                    return "Password is Required";
                  }else if(input.length<8){
                    return "password must be at least 8 chars";
                  }
                  else {
                    return null;
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "ex : *******",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade800),
                    ),
                    prefixIcon: Icon(Icons.lock_outlined,color:  Colors.grey,)
          
                ),
              ),
              SizedBox(height: 32),
              GestureDetector(
                onTap: (){
                  if(loginFormKey.currentState!.validate()){
                    log("every thing is good");
                  }
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
