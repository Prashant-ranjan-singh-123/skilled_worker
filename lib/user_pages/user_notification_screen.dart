import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({Key? key}) : super(key: key);

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  String imagePath = '';
  Map<String, String> _notificationTotal = {
    'Rohan': 'Hello Prashant Lets Meet',
    'Mohit': 'Hello deshval Lets Meet',
    'Kanta': 'Hello Rekha Lets Meet',
    'User4': 'Notification for User 4',
    'User5': 'Notification for User 5',
    'User6': 'Notification for User 6',
    'User7': 'Notification for User 7',
    'User8': 'Notification for User 8',
    'User9': 'Notification for User 9',
    'User10': 'Notification for User 10',
    'User11': 'Notification for User 11',
    'User12': 'Notification for User 12',
    'User13': 'Notification for User 13',
    'User14': 'Notification for User 14',
    'User15': 'Notification for User 15',
    // Add more users here...
    'User97': 'Notification for User 97',
    'User98': 'Notification for User 98',
    'User99': 'Notification for User 99',
    'User100': 'Notification for User 100',
  };

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    imagePath = isDarkTheme
        ? 'assets/onboarding/notification_dark.png'
        : 'assets/onboarding/notification.png';
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        title: Text("Notification"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 19),
              itemCount: _notificationTotal.length,
              itemBuilder: (context, index) => notificationCard(context, index),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget notificationCard(BuildContext context, int index) {
    String key = _notificationTotal.keys.elementAt(index);
    String value = _notificationTotal.values.elementAt(index);
    bool isRead = true; // Assuming all notifications are read initially

    return Dismissible(
      key: Key(key),
      onDismissed: (direction) {
        setState(() {
          // Remove the item from the map when dismissed
          _notificationTotal.remove(key);
        });
      },
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: ShapeDecoration(
          color: isRead ? null : Theme.of(context).colorScheme.primary.withOpacity(0.7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isRead ? null : Theme.of(context).colorScheme.onBackground,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 54,
              height: 54,
              decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: Image.asset(imagePath),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key,
                    style: TextStyle(
                      color: isRead ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onBackground,
                      fontSize: 13,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: TextStyle(
                      color: isRead ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onBackground,
                      fontSize: 10,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: (){
                setState(() {
                  _notificationTotal.remove(key);
                });
                },
                child: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.onPrimary)),
          ],
        ),
      ),
    );
  }
}
