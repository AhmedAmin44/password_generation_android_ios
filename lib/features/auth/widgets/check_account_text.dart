import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget(
      {super.key, required this.text1, required this.text2, this.onTap});
  final String text1;
  final String text2;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: text1, style: CustomTextStyles.poppins400style12),
          TextSpan(
              text: text2,
              style: CustomTextStyles.poppins400style12
                  .copyWith(color: AppColors.lightGrey)),
        ])),
      ),
    );
  }
}
