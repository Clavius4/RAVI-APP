import 'package:flutter/material.dart';

class CustomSettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String font;
  final Color borderColor;
  final VoidCallback onTap;

  const CustomSettingItem({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor = Colors.black,
    this.font = 'Roboto',
    this.borderColor = Colors.transparent,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontFamily: font,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
