import 'package:flutter/cupertino.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';

class AddSubTitle extends StatelessWidget {
  final String text;

  const AddSubTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        text,
        style: RefillThemeTextStyle.title4
            .copyWith(color: RefillThemeColor.gray60),
      ),
    );
  }
}
