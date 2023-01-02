import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/textbox.dart';

class AutoCompleteTextbox extends StatefulWidget {
  const AutoCompleteTextbox({
    super.key,
    required this.options,
    required this.onSelected,
    required this.hintText,
    this.hintSize = 16,
    this.hintColor = const Color.fromRGBO(0, 0, 0, 0.7),
    this.fill = true,
    this.fillColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderRadius = 10,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 15,
    ),
  });

  final List<String> options;
  final void Function(String)? onSelected;

  final String hintText;
  final double hintSize;
  final Color hintColor;

  final bool fill;
  final Color fillColor;

  final Color borderColor;
  final double borderRadius;
  final EdgeInsets contentPadding;

  @override
  State<AutoCompleteTextbox> createState() => _AutoCompleteTextBox();
}

class _AutoCompleteTextBox extends State<AutoCompleteTextbox> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: widget.onSelected,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }

        return widget.options.where((String option) {
          String optionText = option.toLowerCase();
          String inputText = textEditingValue.text.trim().toLowerCase();

          return optionText.contains(inputText);
        });
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return Textbox(
          controller: controller,
          validator: (String? value) => null,
          onFieldSubmitted: (String value) => onFieldSubmitted(),
          focusNode: focusNode,
          hintText: widget.hintText,
          hintSize: widget.hintSize,
          hintColor: widget.hintColor,
          fill: widget.fill,
          fillColor: widget.fillColor,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          contentPadding: widget.contentPadding,
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            String option = options.elementAt(index);
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: ListTile(
                  title: Text(option),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
