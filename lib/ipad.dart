import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'images.dart';

class Ipad extends StatefulWidget {
  const Ipad({Key? key}) : super(key: key);

  @override
  _IpadState createState() => _IpadState();
}

class _IpadState extends State<Ipad> {

  String product = 'ipad';
  String data = '';

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
        top: 15.0,
        bottom: 10.0
        ),
        child: Column(
          children: [
            ImageSlider(product: product),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'APPLE ' + product.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    data,
                    style:
                    TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('details/ipad.txt');
    setState(() {
      data = responseText;
    });
  }

}
