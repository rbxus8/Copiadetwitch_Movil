import 'package:flutter/material.dart';
import '../widgets/stream_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Twitch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9147FF),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mail_outline),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category scroll
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('All'),
                    _buildCategoryChip('Following'),
                    _buildCategoryChip('Game Dev'),
                    _buildCategoryChip('Music'),
                    _buildCategoryChip('Coding'),
                    _buildCategoryChip('Creative'),
                  ],
                ),
              ),
            ),
            const Divider(height: 1, color: Color(0xFF30303D)),
            // Live streams
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'RECOMMENDED CHANNELS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF72767D),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  StreamCard(
                    streamerName: 'Pokimane',
                    gameName: 'Just Chatting',
                    viewers: '45.2K',
                    thumbnail: '🎮',
                    tags: ['English', 'IRL'],
                  ),
                  const SizedBox(height: 12),
                  StreamCard(
                    streamerName: 'sykkuno',
                    gameName: 'Valorant',
                    viewers: '32.1K',
                    thumbnail: '⚔️',
                    tags: ['Competitive', 'Pro'],
                  ),
                  const SizedBox(height: 12),
                  StreamCard(
                    streamerName: 'Myth',
                    gameName: 'Fortnite',
                    viewers: '28.5K',
                    thumbnail: '🏃',
                    tags: ['Competitive'],
                  ),
                  const SizedBox(height: 12),
                  StreamCard(
                    streamerName: 'Valkyrae',
                    gameName: 'Apex Legends',
                    viewers: '25.8K',
                    thumbnail: '💥',
                    tags: ['Competitive', 'Pro'],
                  ),
                  const SizedBox(height: 12),
                  StreamCard(
                    streamerName: 'Shroud',
                    gameName: 'PUBG',
                    viewers: '21.3K',
                    thumbnail: '🎯',
                    tags: ['FPS'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: InputChip(
        label: Text(label),
        backgroundColor: const Color(0xFF30303D),
        labelStyle: const TextStyle(color: Color(0xFFEFEFF1)),
        onPressed: () {},
      ),
    );
  }
}
