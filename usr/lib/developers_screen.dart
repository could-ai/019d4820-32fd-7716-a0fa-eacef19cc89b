import 'package:flutter/material.dart';

class DevelopersScreen extends StatelessWidget {
  const DevelopersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Разработчики', style: TextStyle(fontWeight: FontWeight.bold)),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, 'КОМАНДА'),
                  const SizedBox(height: 8),
                  _buildDeveloperCard(
                    context,
                    name: 'CouldAI Assistant',
                    role: 'Lead AI Developer',
                    description: 'Создание архитектуры, написание кода и генерация UI/UX.',
                    icon: Icons.smart_toy_rounded,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildDeveloperCard(
                    context,
                    name: 'Пользователь',
                    role: 'Product Manager & Visionary',
                    description: 'Генерация идей, постановка задач и контроль качества.',
                    icon: Icons.person_rounded,
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'О ПРИЛОЖЕНИИ'),
                  const SizedBox(height: 8),
                  _buildInfoCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildDeveloperCard(
    BuildContext context, {
    required String name,
    required String role,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 14,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('Версия'),
            trailing: const Text('1.0.0', style: TextStyle(color: Colors.grey)),
          ),
          const Divider(height: 1, indent: 56),
          ListTile(
            leading: const Icon(Icons.update_rounded),
            title: const Text('Последнее обновление'),
            trailing: const Text('Сегодня', style: TextStyle(color: Colors.grey)),
          ),
          const Divider(height: 1, indent: 56),
          ListTile(
            leading: const Icon(Icons.favorite_rounded, color: Colors.redAccent),
            title: const Text('Сделано с любовью'),
            trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
