import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_compagno/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  final Function onSaved;
  final Function validator;
  final String hint;
  final TextInputType? keyboardType;
  final bool? obscureText;

  CustomTextField(
      {required this.onSaved,
      required this.validator,
      required this.hint,
      this.keyboardType,
      this.obscureText});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: TextFormField(
          obscureText: widget.obscureText == null ? false : eye,
          keyboardType: widget.keyboardType,
          onSaved: (value) => widget.onSaved(value),
          onChanged: (value) => widget.onSaved(value),
          decoration: kTextFieldDecoration.copyWith(
              hintText: widget.hint,
              suffixIcon: widget.obscureText != null
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          eye = !eye;
                        });
                      },
                      child: Icon(
                        eye == false
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        size: 15,
                        color: Colors.black,
                      ),
                    )
                  : null),
          enableSuggestions: true,
          style: TextStyle(fontSize: 14),
          validator: (value) => widget.validator(value),
        ));
  }
}
