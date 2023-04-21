import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addition extends StatefulWidget {
  const addition({Key? key}) : super(key: key);

  @override
  _additionState createState() => _additionState();
}

class _additionState extends State<addition> {
  var nmm1;
  var nmm2;
  var result;

  TextEditingController num1 =TextEditingController();
  TextEditingController num2 =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    num1 =TextEditingController();
    num2 =TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num1,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num2,

              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {

              });
              nmm1 =num1.text;
              nmm2 = num2.text;
              result = int.parse(nmm1) + int.parse(nmm2);




            }, child: Text("Result")),
            SizedBox(height: 20,),

            Text('${result.toString()}'),


          ],
        ),
      ),
    );
  }
}
