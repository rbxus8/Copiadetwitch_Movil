import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  final List<String> _recentSearches = [
    'Valorant',
    'League of Legends',
    'Fortnite',
    'Minecraft',
    'Just Chatting',
  ];

  final List<Map<String, String>> _searchResults = [
    {'name': 'Valorant Pro League', 'type': 'Game'},
    {'name': 'League Championship', 'type': 'Game'},
    {'name': 'Fortnite Streams', 'type': 'Category'},
    {'name': 'Minecraft Building', 'type': 'Category'},
    {'name': 'Pokimane', 'type': 'Streamer'},
    {'name': 'Ninja', 'type': 'Streamer'},
    {'name': 'Sykkuno', 'type': 'Streamer'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Color(0xFFEFEFF1)),
          decoration: InputDecoration(
            hintText: 'Search channels, games, and more',
            hintStyle: const TextStyle(color: Color(0xFF72767D)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFF30303D),
            prefixIcon: const Icon(Icons.search, color: Color(0xFF72767D)),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
          onChanged: (value) {
            setState(() {
              _isSearching = value.isNotEmpty;
            });
          },
        ),
      ),
      body: _isSearching ? _buildSearchResults() : _buildRecentSearches(),
    );
  }

  Widget _buildRecentSearches() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RECENT SEARCHES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF72767D),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                ..._recentSearches.map(
                  (search) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        const Icon(Icons.history, color: Color(0xFF72767D)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            search,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFEFEFF1),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close,
                              color: Color(0xFF72767D)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final result = _searchResults[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF30303D),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    result['type'] == 'Streamer' ? '👤' : '🎮',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result['name']!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFEFEFF1),
                      ),
                    ),
                    Text(
                      result['type']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF72767D),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward, color: Color(0xFF72767D)),
            ],
          ),
        );
      },
    );
  }
}
