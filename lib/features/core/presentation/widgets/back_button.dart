import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop_01/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_workshop_01/features/main/presentation/bloc/main_state.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MainBloc>().add(MainDecrement());
        Navigator.pop(context);
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(9999))),
        child: const Icon(
          Icons.arrow_back,
          size: 24,
        ),
      ),
    );
  }
}
