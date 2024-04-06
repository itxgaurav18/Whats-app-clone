import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CountryPage.dart';
import 'package:whatsapp_clone/Model/CountryModel.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryname = "India";
  String countrycode = "+91";
  TextEditingController _controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
            color: Colors.teal,
          fontWeight: FontWeight.w700,
           fontSize: 18,
           wordSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
         Icon(Icons.more_vert,
           color:Colors.black,
         ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          
          children: [
            Text("Vishwvarta will send an sms message to verify your number",
                style: TextStyle(
                    fontSize: 13.5
                ),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
                "What's my number?",
              style: TextStyle(
                  fontSize: 12.5,
                color: Colors.cyan[800]
              ),
            ),
            SizedBox(
              height: 15,
            ),
                  countryCard(),
            SizedBox(
              height: 5,
            ),
                  number(),
            Expanded(
              child: Container(
                
              ),
            ),
            InkWell(
              onTap:() {
                if(_controller.text.length<10)
                  {
                    showMydilogue1();
                  } else{
                  showMydilogue();
                }
              } ,
              child: Container(
                color: Colors.tealAccent[400],
                height: 40,
                width: 70,
                child: Center
                  (child: Text(
                  "NEXT",
                  style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                ),
                ),
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
     Widget countryCard() {
    return InkWell(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (builder) =>
            CountryPage(setCountryData:setCountryData)));
      } ,
      child: Container(
        width: MediaQuery.of(context).size.width/1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border
            (bottom: BorderSide(
            color: Colors.teal,
            width: 1.8,

          ),
          )
        ),
         child:Row(
           children: [
             Expanded(
               child: Container(
                 child: Center(
                   child: Text(
                      countryname,
                   style: TextStyle(fontSize: 16),
                   ),
                 ),
               ),
             ),
             Icon(Icons.arrow_drop_down,
               color: Colors.teal
               ,size: 28
               ,)
             
           ],
         ) ,

      ),
    );
}
Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      height: 38,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
                border: Border
                  (bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,

                ),
                )
            ),
            child: Row(
              children: [
                SizedBox(
                  width:10 ,
                ),
                Text(
                    "+",
                    style: TextStyle(fontSize: 18)
                ),
                SizedBox(
                  width:15 ,
                ),
                Text(
                  countrycode.substring(1)
                  ,style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border
                  (bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
                )
            ),
            width: MediaQuery.of(context).size.width/1.5-100,
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Phone Number"
              ),
            ),
          ),
        ],
      ),
    );
}




 void setCountryData(CountryModel countryModel)
 {
setState(() {
countryname= countryModel.name;
countrycode=countryModel.code;

}
);
Navigator.pop(context);
 }
 Future<void> showMydilogue()
 {
   return showDialog(context: context,
       builder: (BuildContext context)
       {
     return AlertDialog(
       content:SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Verifying your phone number",
             style: TextStyle(fontSize: 14),
             ),
             SizedBox(
               height: 10,
             ),
             Text(countrycode +" "+ _controller.text,
               style: TextStyle(fontSize: 13.5),
             ),
             SizedBox(
               height: 10,
             ),
             Text(
                 "Is this ok,or would you like to edit the number"
             ),
           ],
         ),
       ) ,
       actions: [
         TextButton(onPressed: (){
           Navigator.pop(context);
         },
             child: Text("Edit")),
         TextButton(onPressed: (){

         }, child: Text("Ok")),
       ],
     );

   });
 }
  Future<void> showMydilogue1()
  {
    return showDialog(context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            content:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("There is no number entered",
                    style: TextStyle(fontSize: 14),
                  ),

                ],
              ),
            ) ,
            actions: [

              TextButton(onPressed: (){

              }, child: Text("Ok")),
            ],
          );

        });
  }
}
