import 'package:flutter/material.dart';

class ChipCheck extends StatefulWidget {
  const ChipCheck({super.key, required this.label});

  final String label;

  @override
  State<ChipCheck> createState() => _ChipCheckState();
}

class _ChipCheckState extends State<ChipCheck> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.label),
      selected: _isSelected,
      onSelected: (bool newBoolValue) {
        setState(() {
          _isSelected = newBoolValue;
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: Color.fromRGBO(194, 232, 255, 1),
          width: 2.0,
        ),
      ),
      backgroundColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
