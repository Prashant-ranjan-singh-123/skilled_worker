import 'package:flutter/material.dart';
import 'package:v_bhartiya/on_boarding/style_on_boarding_page.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    String imagePath = isDarkTheme
        ? 'assets/onboarding/Payment_dark.png'
        : 'assets/onboarding/Payment.png';
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
                  Text('Payment', style: TextStyleIs().heading(context)),
                  const SizedBox(height: 15,),
                  Text('Explore our diverse range of payment plans, each designed to provide flexibility and cater to your specific needs and preferences.',
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
