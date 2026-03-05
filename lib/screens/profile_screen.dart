import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
            // Profile Header
            Container(
              color: const Color(0xFF18181B),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9147FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('👤', style: TextStyle(fontSize: 40)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEFEFF1),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '@username',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF72767D),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF9147FF),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Verified',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFEFEFF1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Just vibing and streaming games! 🎮',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFEFEFF1),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStat('123K', 'Followers'),
                      _buildStat('456', 'Following'),
                      _buildStat('12', 'Clips'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Menu Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  _buildMenuItemTile('Creator Dashboard', Icons.dashboard),
                  const Divider(color: Color(0xFF30303D), height: 1),
                  _buildMenuItemTile('Channel Settings', Icons.settings),
                  const Divider(color: Color(0xFF30303D), height: 1),
                  _buildMenuItemTile('Creator Camp', Icons.school),
                  const Divider(color: Color(0xFF30303D), height: 1),
                  _buildMenuItemTile('Account Settings', Icons.person),
                  const Divider(color: Color(0xFF30303D), height: 1),
                  _buildMenuItemTile('Preferences', Icons.tune),
                  const Divider(color: Color(0xFF30303D), height: 1),
                  _buildMenuItemTile('Help Center', Icons.help),
                  const Divider(color: Color(0xFF30303D), height: 1),
                  _buildMenuItemTile('Sign Out', Icons.logout, isRed: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9147FF),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF72767D),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItemTile(String title, IconData icon, {bool isRed = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isRed ? Colors.red : const Color(0xFFEFEFF1),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: isRed ? Colors.red : const Color(0xFFEFEFF1),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: const Color(0xFF72767D),
      ),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}
