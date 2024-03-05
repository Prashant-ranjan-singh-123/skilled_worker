import 'package:flutter/material.dart';
class User {
  String name;
  String fatherName;
  String maritalStatus;
  String bloodGroup;
  String height;
  String weight;
  String religion;
  String address;
  String city;
  String state;
  String country;
  String contactNo;
  String email;

  User({
    required this.name,
    required this.fatherName,
    required this.maritalStatus,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.religion,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.contactNo,
    required this.email,
  });
}

class UserProfile extends StatelessWidget {
  final User user = User(
    name: "John Doe",
    fatherName: "Michael Doe",
    maritalStatus: "Single",
    bloodGroup: "A+",
    height: "6'0\"",
    weight: "160 lbs",
    religion: "Christian",
    address: "123 Main Street",
    city: "Anytown",
    state: "Somestate",
    country: "Somecountry",
    contactNo: "123-456-7890",
    email: "john.doe@example.com",
  );

  void general_info_edit(){

  }

  void contact_detail_edit(){

  }

  void photo_edit(){

  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    String imagePath = isDarkTheme
        ? 'assets/onboarding/profilePhoto_dark.png'
        : 'assets/onboarding/profilePhoto.png';
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 154, // Width + 2 * border width
                      height: 154, // Height + 2 * border width
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2, // Border width
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      clipBehavior: Clip.antiAlias, // Ensure the border is rendered outside the circle
                      child: Image.asset(imagePath),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -10,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt,
                          color: Theme.of(context).colorScheme.onPrimary,),
                        onPressed: () {
                          // Add your edit functionality here
                        },
                      ),
                    ),
                  ],
                ),

              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "General Information",
                    style: TextStyle(
                      fontSize: 19,
                      height: 1.38,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit_note,
                      color: Theme.of(context).colorScheme.onPrimary,
                    size: 32,),
                    onPressed: () {
                      // Add your edit functionality here
                    },
                  )
                ],
              ),
              WidgetCards(context, 10, 10, 0, 0, 'Name', 'Prashant Ranjan Singh'),
              SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'Date of Birth', '23/8/1964'),
              SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'Age', '58'),
              SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'Martial Status', 'Single'),
              SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'Height', '4\'0'),
              SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'Weight', '60kg'),
              SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 10, 10, 'Blood Group', 'O+'),
              SizedBox(height: 30,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contact Detail",
                    style: TextStyle(
                        fontSize: 19,
                        height: 1.38,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit_note,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 32,),
                    onPressed: () {
                      // Add your edit functionality here
                    },
                  )
                ],
              ),
              WidgetCards(context, 10, 10, 0, 0, 'Mobile Number', '+917067597028'),
              const SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'Country', 'India'),
              const SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'State', 'Madhya Pradesh'),
              const SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 0, 0, 'City', 'Indore'),
              const SizedBox(height: 0.5,),
              WidgetCards(context, 0, 0, 10, 10, 'Pin code', '432018'),
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 19,
                        height: 1.38,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8,),

              settingsCardWidget(context,title: 'Report',trailing: const Icon(Icons.report_gmailerrorred),),
              settingsCardWidget(context,title: 'Terms and Condition', trailing: const Icon(Icons.notes_outlined),),
              settingsCardWidget(context,title: 'Share App', trailing: const Icon(Icons.share),),
              settingsCardWidget(context,title: 'Rate App', trailing: const Icon(Icons.star_rate_rounded),),
              settingsCardWidget(context,title: 'Sign Out', trailing: const Icon(Icons.logout_outlined),),






              SizedBox(height: 110,)
            ],
          ),
        ),
      ),
    );
  }

  Widget WidgetCards(
      BuildContext context,
      int topLeft,
      int topRight,
      int bottomLeft,
      int bottomRight,
      String firstItem,
      String secondItem,
      ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      // height: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(topRight.toDouble()),
          topLeft: Radius.circular(topLeft.toDouble()),
          bottomRight: Radius.circular(bottomRight.toDouble()),
          bottomLeft: Radius.circular(bottomLeft.toDouble()),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(firstItem, style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            fontSize: 14),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(secondItem, style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.background),),
          ),
          // Add more child widgets as needed
        ],
      ),
    );
  }

  Widget settingsCardWidget(
      BuildContext context, {
        Widget? leading,
        required String title,
        String? trailingText,
        Widget? trailing,
        BorderRadiusGeometry borderRadius = const BorderRadius.all(Radius.circular(10)),
        Color? backgroundColor,
        VoidCallback? onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: backgroundColor ?? Theme.of(context).colorScheme.onBackground,
                borderRadius: borderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: leading ?? SizedBox.shrink(),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 14,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (trailingText != null)
                    Text(
                      trailingText!,
                      style: const TextStyle(
                        color: Color(0xFF0F62FE),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  if (trailing != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox.square(
                        dimension: 24,
                        child: trailing!,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

}