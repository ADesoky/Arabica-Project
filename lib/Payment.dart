import 'package:flutter/material.dart';

class Payement extends StatefulWidget {
  const Payement({Key? key}) : super(key: key);

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Container(
                width: 345,
                height: 118,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF00A006),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(width: 15.0,),
                    Text('800\$'
                      ,style: TextStyle(fontSize: 40),),

                    SizedBox(width: 130,),
                    Text('iced coffee \nesprisso\niced coffee'
                      ,style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0,),
          Row(
            children: [
              SizedBox(width:86.5 ,),
              Image.asset('asset/images/Group 302.png')
            ],
          ),
          SizedBox(height: 15.0,),
          TextFormField(
            keyboardType: TextInputType.name,
            onFieldSubmitted: (value) {
              print(value);
            },
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefix: Icon(Icons.text_format),
                label: Text('Name ON Card'),
                // hintText: 'Add your name ',
                labelStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(height: 23.0,),
          TextFormField(
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              print(value);
            },
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefix: Icon(Icons.numbers),
                label: Text('Card Number'),
                // hintText: 'Add your name ',
                labelStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.numbers),
                      label: Text('Expiration Date'),
                      // hintText: 'Add your name ',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(width: 15.0),
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.numbers),
                      label: Text('CVV'),
                      // hintText: 'Add your name ',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
          SizedBox(height:23.0 ,),
          Container(
            width: double.infinity,
            height: 60.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A006)),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('Checkout',style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}