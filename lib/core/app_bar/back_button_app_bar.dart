import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refill_app/core/app_bar/primary_app_bar.dart';

class BackButtonAppBar extends ConsumerWidget {
  const BackButtonAppBar({
    super.key,
    this.leading,
    this.title,
  });

  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryAppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icon/ic_left.svg')),
      title: title,
    );
  }
}
