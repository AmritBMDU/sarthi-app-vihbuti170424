import 'package:flutter/cupertino.dart';
import 'package:sarthi/app/global/appcolor.dart';

class SpleshUi extends StatefulWidget {
  const SpleshUi({Key? key}) : super(key: key);

  @override
  State<SpleshUi> createState() => _SpleshUiState();
}

class _SpleshUiState extends State<SpleshUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appcolor.blue,
      child: Container(
        width: 50,
        height: 50,
        color: appcolor.bluelight,
      ),
    );
  }
}
