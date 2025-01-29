import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  TextEditingController nameCon=TextEditingController();
  TextEditingController passCon=TextEditingController();

  final GlobalKey<FormState> formKey=GlobalKey();

  var checkField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  (checkField=="name")?
                    Colors.red:Colors.green,
                    width: 2.5
                  )
                ),
                child: TextFormField(
                  controller: nameCon,

                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      setState(() {
                        checkField="name";
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Name Field is Empty")));
                    }
                    return "";
                  },
                ),
              ),

              DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                        (checkField=="password")?
                        Colors.red:Colors.green,
                        width: 2.5
                    )
                ),
                child: TextFormField(
                  controller: passCon,
                  decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      contentPadding: EdgeInsets.only(left: 15),
                      border: InputBorder.none
                  ),
                ),
              ),

              ElevatedButton(onPressed: (){

                formKey.currentState!.validate();
                /*   if(nameCon.text.isEmpty){

                  setState(() {
                    checkField="name";
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Name Field is Empty")));
                }
                else if(passCon.text.isEmpty){
                  setState(() {
                    checkField="password";
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password Field is empty")));
                }
                else{
                  setState(() {
                    checkField="";
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful")));
                }*/

              }, child: Text('Submit'))

            ],


          ),
        ),
      ),
    );
  }
}
