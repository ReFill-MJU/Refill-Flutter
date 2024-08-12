import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/button/primary_button.dart';
import 'package:refill_app/data/repository/child_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
appBar: AppBar(),
      body: Column(
        children: [
          PrimaryButton(
            onPressed: () {
              ChildRepository.childcareTest('data');
            },
            enabled: true,
            text: '안녕',
          )
        ],
      ),
    );
  }
}
