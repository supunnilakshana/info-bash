import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final Function function;
  const RegisterButton({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
      padding: EdgeInsets.only(top: size.height*0.02,bottom: size.height*0.02,right: size.width*0.03),
      child: Container(
        width: 150,
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)
                  )
              )
          ),
          onPressed: (){
            function();
          },
          child: Text('Register',style: TextStyle(
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}
