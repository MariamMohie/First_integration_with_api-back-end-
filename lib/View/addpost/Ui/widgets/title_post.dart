import 'package:flutter/material.dart';

class title_post extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;

  const title_post({Key? key, required this.hintText, this.controller})
      : super(key: key);

  @override
  State<title_post> createState() => _textfiledState();
}

class _textfiledState extends State<title_post> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: Column(
        children: [
        TextFormField(
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 30), 
            //  border: InputBorde.none,
          
             focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue, 
                ),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (textValue) {
              if (textValue == null || textValue.isEmpty) {
                return 'required!';
              }
              return null;
            },
            controller: widget.controller,
          )
        ],
      ),
    );
  }
}
