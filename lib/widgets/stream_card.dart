import 'package:flutter/material.dart';

class StreamCard extends StatelessWidget {
  final String streamerName;
  final String gameName;
  final String viewers;
  final String thumbnail;
  final List<String> tags;

  const StreamCard({
    Key? key,
    required this.streamerName,
    required this.gameName,
    required this.viewers,
    required this.thumbnail,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFF30303D),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: thumbnail.startsWith('http')
                    ? Image.network(
                        thumbnail,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.live_tv, size: 60, color: Color(0xFF72767D)),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          thumbnail,
                          style: const TextStyle(fontSize: 60),
                        ),
                      ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.circle, size: 6, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Streamer info
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF9147FF),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('👤', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    streamerName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEFEFF1),
                    ),
                  ),
                  Text(
                    gameName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF72767D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    viewers,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF72767D),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    children: tags
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF30303D),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF72767D),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
