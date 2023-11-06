import 'package:flutter/material.dart';

class MyDialog{
  static dialog({required BuildContext context, required String? result, required Function()? function}){
    var dialogArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 250.0 : 300.0;
    return showDialog(
        barrierColor: Colors.transparent,
        //barrierColor: widget.appColorsController.gridBtnColor.value,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            //backgroundColor: widget.appColorsController.gridBtnColor.value,
            //backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: dialogArea,
              width: dialogArea,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result!),
                  ElevatedButton(
                    onPressed: function,
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
