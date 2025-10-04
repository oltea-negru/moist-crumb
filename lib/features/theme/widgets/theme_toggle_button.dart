import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/theme/cubits/cubit/theme_cubit.dart';
import 'package:moist_crumb/features/theme/cubits/cubit/theme_state.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return IconButton(
          style: IconButton.styleFrom(
            backgroundColor: state.themeMode == ThemeMode.light
                ? Colors.white.withAlpha(128)
                : Colors.black.withAlpha(128),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          icon: Icon(
            state.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        );
      },
    );
  }
}
