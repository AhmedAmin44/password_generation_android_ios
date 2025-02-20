import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_text_style.dart';

class ForgetPasswordSubTitle extends StatelessWidget {
  const ForgetPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        AppStrings.forgotPasswordSubTitle,
        style: CustomTextStyles.poppins400style12.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
