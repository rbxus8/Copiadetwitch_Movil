import 'package:flutter/material.dart';
import '../widgets/stream_card.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Following',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
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
                    'LIVE CHANNELS',
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
                    streamerName: 'Valkyrae',
                    gameName: 'Apex Legends',
                    viewers: '25.8K',
                    thumbnail: '💥',
                    tags: ['Competitive', 'Pro'],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'CHANNELS OFFLINE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF72767D),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildOfflineChannel('sykkuno', 'Last live 2 hours ago'),
                  const SizedBox(height: 12),
                  _buildOfflineChannel('Myth', 'Last live 5 hours ago'),
                  const SizedBox(height: 12),
                  _buildOfflineChannel('Shroud', 'Last live 1 day ago'),
                  const SizedBox(height: 12),
                  _buildOfflineChannel('Ninja', 'Last live 2 days ago'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineChannel(String name, String lastLive) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF30303D),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text('👤', style: TextStyle(fontSize: 20)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFEFEFF1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                lastLive,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF72767D),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
