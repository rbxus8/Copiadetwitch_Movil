import 'package:flutter/material.dart';
import '../widgets/stream_card.dart';
import '../services/twitch_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TwitchService _twitchService = TwitchService();
  List<dynamic> _streams = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadStreams();
  }

  Future<void> _loadStreams() async {
    try {
      final streams = await _twitchService.getTopStreams();
      setState(() {
        _streams = streams;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $_error', textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadStreams,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadStreams,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              ..._streams.map((stream) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: StreamCard(
                                      streamerName: stream['user_name'] ?? 'Unknown',
                                      gameName: stream['game_name'] ?? 'Just Chatting',
                                      viewers: _formatViewers(stream['viewer_count'] ?? 0),
                                      thumbnail: stream['thumbnail_url']?.toString().replaceAll('{width}', '320').replaceAll('{height}', '180') ?? '🎮',
                                      tags: [],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  String _formatViewers(int viewers) {
    if (viewers >= 1000) {
      return '${(viewers / 1000).toStringAsFixed(1)}K';
    }
    return viewers.toString();
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
