import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Footer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Text(
              '2025 Movie Web All rights reversed',
              style: TextStyle(color: Colors.grey[800]),
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook),
                SizedBox(width: 10),
                Icon(Icons.attachment),
                SizedBox(width: 10),
                Icon(Icons.account_box_rounded),
                SizedBox(width: 10),
                Icon(Icons.ondemand_video),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "About Us", 
                  style: TextStyle(
                    color: Colors.grey[800]
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Privacy Policy", 
                  style: TextStyle(
                    color: Colors.grey[800]
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Terms of Service", 
                  style: TextStyle(
                    color: Colors.grey[800]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
