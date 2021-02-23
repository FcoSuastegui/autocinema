import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InputTextCardBloc extends StatelessWidget {
  final TextFieldBloc<Object> textFieldBloc;
  final String labelText, hintText, counterText;
  final TextInputType keyboardType;
  final SuffixButton suffixButton;
  final Widget suffix;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Function onSubmitted;
  final TextStyle labelStyle, style;
  final int maxLength;
  final bool maxLengthEnforced, readOnly;
  final Color borderColor;
  final FocusNode focusNode;
  final TextCapitalization textCapitalization;

  const InputTextCardBloc({
    Key key,
    @required this.textFieldBloc,
    this.labelText,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.inputFormatters,
    this.suffixButton,
    this.labelStyle,
    this.style,
    this.maxLength,
    this.maxLengthEnforced = false,
    this.hintText,
    this.suffix,
    this.counterText,
    this.borderColor = const Color(0xFF000000),
    this.readOnly = false,
    this.focusNode,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      textInputAction: textInputAction,
      textFieldBloc: textFieldBloc,
      focusNode: focusNode,
      keyboardType: keyboardType,
      suffixButton: suffixButton,
      maxLength: maxLength,
      maxLengthEnforced: maxLengthEnforced,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText ?? '',
      ),
      style: style,
    );
  }
}
