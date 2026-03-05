import 'package:flutter/material.dart';
import '../widgets/category_card.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Browse',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'RECOMMENDED GAMES',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF72767D),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      CategoryCard(
                        title: 'Valorant',
                        viewers: '892K',
                        icon: '🎮',
                      ),
                      CategoryCard(
                        title: 'League of Legends',
                        viewers: '745K',
                        icon: '⚔️',
                      ),
                      CategoryCard(
                        title: 'Fortnite',
                        viewers: '632K',
                        icon: '🏃',
                      ),
                      CategoryCard(
                        title: 'Minecraft',
                        viewers: '521K',
                        icon: '⛏️',
                      ),
                      CategoryCard(
                        title: 'Counter-Strike 2',
                        viewers: '456K',
                        icon: '🎯',
                      ),
                      CategoryCard(
                        title: 'Rust',
                        viewers: '389K',
                        icon: '🛠️',
                      ),
                      CategoryCard(
                        title: 'Just Chatting',
                        viewers: '324K',
                        icon: '💬',
                      ),
                      CategoryCard(
                        title: 'Elden Ring',
                        viewers: '267K',
                        icon: '🗡️',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
