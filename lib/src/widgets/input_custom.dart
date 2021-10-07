import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {

  String label;
  Icons icon;
  TextInputType typeInput;
  Function onChanged;
  String errorText;
  InputCustom({
    String label, 
    Icons icon,
    TextInputType typeInput,
    Function onChanged,
    String errorText
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(29)
      ),
      child: TextField(
        onChanged: (value) => onChanged,
        keyboardType: typeInput,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.black12),
          hintText: label,
          border: InputBorder.none,
          errorText: errorText,
        ),
      ),
    );
  }
}