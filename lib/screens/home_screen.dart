import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  final List<_QuickAction> _actions = const [
    _QuickAction(icon: Icons.check_box_outlined, label: 'My Tasks'),
    _QuickAction(icon: Icons.flag_outlined, label: 'Goals'),
    _QuickAction(icon: Icons.show_chart_rounded, label: 'Progress'),
    _QuickAction(icon: Icons.favorite_border_rounded, label: 'Wellness'),
  ];

  final List<_PlanItem> _plan = const [
    _PlanItem(
        title: 'Morning Reflection',
        time: '08:00 AM',
        icon: Icons.wb_sunny_outlined),
    _PlanItem(
        title: 'Workout', time: '09:30 AM', icon: Icons.fitness_center),
    _PlanItem(
        title: 'Read for 20 mins', time: '07:00 PM', icon: Icons.menu_book_outlined),
  ];

  void _onQuickActionTap(String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening $label...'), duration: const Duration(milliseconds: 900)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu_rounded, color: AppColors.textDark),
                  const Text('trusty.',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark)),
                  const Icon(Icons.notifications_none_rounded,
                      color: AppColors.textDark),
                ],
              ),
              const SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello, ${widget.userName} 👋',
              style: AppTextStyles.heading.copyWith(fontSize: 22)),
          const SizedBox(height: 8),
          const Text('What are we doing today?',
              style: AppTextStyles.subheading),
        ],
      ),
    ),
    Image.asset(
      'assets/images/home_character.png',
      height: 64,
      fit: BoxFit.contain,
    ),
  ],
),
const SizedBox(height: 20),
              // Gradient highlight card.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Daily Reminder',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                          SizedBox(height: 6),
                          Text('You\'ve got this!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Small steps each day\ntoward your goals.',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: const Icon(Icons.arrow_forward_rounded,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Quick Actions', style: AppTextStyles.label),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _actions
                    .map((a) => _QuickActionTile(
                          action: a,
                          onTap: () => _onQuickActionTap(a.label),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Today's Plan", style: AppTextStyles.label),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('View all',
                        style: TextStyle(
                            color: AppColors.purpleDark, fontSize: 12)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ..._plan.map((p) => _PlanTile(item: p)),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
        selectedItemColor: AppColors.purpleDark,
        unselectedItemColor: AppColors.textGrey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, color: AppColors.pink, size: 32),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded), label: 'Stats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});
}

class _QuickActionTile extends StatelessWidget {
  final _QuickAction action;
  final VoidCallback onTap;
  const _QuickActionTile({required this.action, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.fieldFill,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(action.icon, color: AppColors.purpleDark),
          ),
          const SizedBox(height: 6),
          Text(action.label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

class _PlanItem {
  final String title;
  final String time;
  final IconData icon;
  const _PlanItem({required this.title, required this.time, required this.icon});
}

class _PlanTile extends StatelessWidget {
  final _PlanItem item;
  const _PlanTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.fieldFill,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, size: 20, color: AppColors.purpleDark),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: AppTextStyles.body),
                Text(item.time, style: AppTextStyles.subheading),
              ],
            ),
          ),
          Checkbox(
            value: false,
            onChanged: (_) {},
            activeColor: AppColors.purpleDark,
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }
}
