import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Details extends StatefulWidget {
  const Details(this.product, {
    Key? key,
      }) : super(key: key);

  final String product;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  String data = '';

  fetchFileData() async {
      String responseText;
      if(widget.product == 'watch'){
        responseText = await rootBundle.loadString('details/watch.txt');
        setState(() {
          data = responseText;
        });
      }else if(widget.product == 'ipad'){
        responseText = await rootBundle.loadString('details/ipad.txt');
        setState(() {
          data = responseText;
        });
      }else if(widget.product == 'macbook'){
        responseText = await rootBundle.loadString('details/macbook.txt');
        setState(() {
          data = responseText;
        });
      }
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        data,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }
}
