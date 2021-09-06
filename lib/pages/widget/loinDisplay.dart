import 'package:flutter/material.dart';
import 'package:ellie_fe/components/textWidget.dart';

class LoinDisplay extends StatelessWidget {
  const LoinDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text:"Here to Get", fontSize:26, isUnderLine:false),
            TextWidget(text:"Welcomed !", fontSize:26, isUnderLine:false),
          ],
        )
    );
  }
}
