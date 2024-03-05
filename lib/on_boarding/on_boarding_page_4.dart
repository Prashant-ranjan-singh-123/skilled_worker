import 'package:flutter/material.dart';
import 'package:v_bhartiya/on_boarding/style_on_boarding_page.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    String imagePath = isDarkTheme
        ? 'assets/onboarding/Management_dark.png'
        : 'assets/onboarding/Management.png';
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.13,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(imagePath),
                  const SizedBox(height: 10,),
                  Text('Notification', style: TextStyleIs().heading(context)),
                  const SizedBox(height: 15,),
                  Text('Stay informed with personalized notifications tailored to your preferences and never miss important updates or announcements from our platform.',
                    style: TextStyleIs().subtitle(context)
                    , textAlign: TextAlign.center,),
                ],
              ),
            ),
          ],
        )
    );
  }
}
