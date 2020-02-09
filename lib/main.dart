import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrscan/qrscan.dart';
import 'package:qrcode/webpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Leitor QRCode',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Leitor QRCode')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: MaterialButton(
                color: Colors.blue,
                padding: EdgeInsets.all(20.0),
                child: Text("Scan QRCode",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () => _scanQrCode()
            ),
          ) ,

          //            Text(code,
          //              style: TextStyle(
          //                fontSize: 24,
          //                fontWeight: FontWeight.bold
          //              ),
          //            )
        ],
      ),
    );
  }

  _scanQrCode<String>() async{
    try{
      final result = await scan();

      setState((){
        code = result;
//        Scaffold(
//          body: SnackBar(content: Text(result)),
//        );
        return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebPage(result))
        );
      });

    }catch(e){
      print(e);
    }

  }
}
