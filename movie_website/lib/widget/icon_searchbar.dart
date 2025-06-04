import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconSearchbar extends StatelessWidget implements PreferredSizeWidget {
  const IconSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('lottie/movie.json', height: 30),
            const SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.cancel),
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(67);
}
