import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Plan {
  final String name;
  final String price;
  final List<String> features;
  Plan({
    required this.name,
    required this.price,
    required this.features,
  });
}

class BillingScreen extends StatelessWidget {
  late Map<String, String> plansIs;
  late Map<String, String> plansPrice;
  late List<Plan> plans;

  BillingScreen() {
    plansIs = {
      'Basic1': 'Feature 1',
      'Basic2': 'Feature 2',
      'Basic3': 'Feature 3',
      'Standard1': 'Feature 1',
      'Standard2': 'Feature 2',
      'Standard3': 'Feature 3',
      'Premium1': 'Feature 1',
      'Premium2': 'Feature 2',
      'Premium3': 'Feature 3',
    };

    plansPrice = {
      'Basic':'₹ 599/month',
      'Standard':'₹ 799/month',
      'Premium':'₹ 999/month',
    };



    plans = [
      Plan(
        name: 'Basic',
        price: "${plansPrice['Basic']}",
        features: [plansIs['Basic1']!, plansIs['Basic2']!, plansIs['Basic3']!],
      ),
      Plan(
        name: 'Standard',
        price: "${plansPrice['Standard']}",
        features: [plansIs['Standard1']!, plansIs['Standard2']!, plansIs['Standard3']!],
      ),
      Plan(
        name: 'Premium',
        price: "${plansPrice['Premium']}",
        features: [plansIs['Premium1']!, plansIs['Premium2']!, plansIs['Premium3']!],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Theme.of(context).colorScheme.background, Theme.of(context).colorScheme.background],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.8,
                  enableInfiniteScroll: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  pageSnapping: true, // Enable page snapping effect
                ),
                items: plans.map((plan) {
                  return Builder(
                    builder: (BuildContext context1) {


                      return Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 6,
                        shadowColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3), // Shadow color
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
                            border: Border.all(color: Theme.of(context).colorScheme.onPrimary, width: 2),
                            borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Theme.of(context).colorScheme.background.withOpacity(0.3), // Shadow color
                            //     spreadRadius: 10,  // Spread radius
                            //     blurRadius: 15,    // Blur radius
                            //     offset: Offset(0, 2), // Shadow position
                            //   ),
                            // ],
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8,left: 8, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10,),
                                  Text(
                                    plan.name,
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    plan.price,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: plan.features.map((feature) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Theme.of(context).colorScheme.primary,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              feature,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Roboto',
                                                color:Theme.of(context).colorScheme.onPrimary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const Spacer(), // Add Spacer to push the button to the bottom
                                  TextButton(
                                    onPressed: () {
                                      // Add functionality for payment button
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                            Icons.payment,
                                            color: Theme.of(context).colorScheme.background
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Make Payment',
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.background,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      ;
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}