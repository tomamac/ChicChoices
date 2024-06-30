import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:flutter/material.dart';

class ForgetPasswordHeaderWidget extends StatelessWidget {
  const ForgetPasswordHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: LRPadding(context),
      child: Row(
        children: [
          const Spacer(flex: 1),
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: const Color(0xFFE59B57),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'ยืนยันตัวตน',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 2),
          logoWidget(85, 85),
        ],
      ),
    );
  }
}
