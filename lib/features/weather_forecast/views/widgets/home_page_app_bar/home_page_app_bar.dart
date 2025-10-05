import 'package:flutter/material.dart';
import 'package:moist_crumb/features/theme/widgets/theme_toggle_button.dart';
import 'package:moist_crumb/utils/responsive.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              final isLight = Theme.of(context).brightness == Brightness.light;
              return Container(
                padding: Responsive.insetsSymmetric(
                  context,
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: (isLight ? Colors.white : Colors.black).withAlpha(128),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Responsive.radius(context, 10)),
                  ),
                ),
                child: Text(
                  "Moist Crumb",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isLight ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                ),
              );
            },
          ),
        ],
      ),
      actions: const [ThemeToggleButton()],
    );
  }
}


