import 'package:flutter/material.dart';
import 'package:v_bhartiya/on_boarding/style_on_boarding_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});


  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    String imagePath = isDarkTheme
        ? 'assets/onboarding/Profile_dark.png'
        : 'assets/onboarding/Profile.png';
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
                  Text('Profile', style: TextStyleIs().heading(context)),
                  const SizedBox(height: 15,),
                  Text('Easily customize your personal information, and more through our intuitive Profile feature.',
                    style: TextStyleIs().subtitle(context),
                    textAlign: TextAlign.center,),
                ],
              ),
            ),
          ],
        )
    );
  }
}
