import 'package:dukan/constants/design_constants/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatefulWidget {
  final int index;

  final List<dynamic> list;

  const CustomIndicator({
    Key? key,
    required this.index,
    required this.list,
  }) : super(key: key);

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
                widget.list.length,
                (index) => widget.index == index
                    ? const ActiveDot()
                    : const InactiveDot()),
          ),
        ],
      ),
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 25,
        height: 8,
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
