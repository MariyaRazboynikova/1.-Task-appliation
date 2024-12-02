import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_application/features/presentation/widgets/my_buttons.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Task Application',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            ButtonForInitialPage(
              text: 'My tasks',
              onTap: () {
                Navigator.pushNamed(context, '/task_page');
              },
            )
          ],
        ),
      ),
    );
  }
}
