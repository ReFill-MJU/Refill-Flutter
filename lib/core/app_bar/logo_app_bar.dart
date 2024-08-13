import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refill_app/core/app_bar/primary_app_bar.dart';

class LogoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const LogoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryAppBar(
        leading: Padding(
      padding: const EdgeInsets.all(16.0),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
