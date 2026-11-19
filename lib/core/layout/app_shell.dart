import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_theme.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    required this.location,
    required this.child,
    super.key,
  });

  final String location;
  final Widget child;

  static const _items = [
    _NavItem('Overview', '/', Icons.grid_view_rounded),
    _NavItem('Contacts', '/contacts', Icons.people_outline_rounded),
    _NavItem('Calls', '/calls', Icons.call_outlined),
    _NavItem('Inbox', '/inbox', Icons.inbox_outlined),
    _NavItem('Reports', '/reports', Icons.bar_chart_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1100;
        final isWide = constraints.maxWidth >= 760;

        if (!isWide) {
          return Scaffold(
            appBar: AppBar(
              title: const _Brand(),
              actions: const [_ProfileButton(), SizedBox(width: 12)],
            ),
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) => context.go(_items[index].path),
              destinations: _items.map((item) {
                return NavigationDestination(
                  icon: Icon(item.icon),
                  label: item.label,
                );
              }).toList(),
            ),
          );
        }

        return Scaffold(
          body: Row(
            children: [
              if (isDesktop)
                SizedBox(
                  width: 248,
                  child: _Sidebar(
                    selectedIndex: _selectedIndex,
                    onSelect: (index) => context.go(_items[index].path),
                  ),
                )
              else
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) => context.go(_items[index].path),
                  labelType: NavigationRailLabelType.all,
                  destinations: _items.map((item) {
                    return NavigationRailDestination(
                      icon: Icon(item.icon),
                      label: Text(item.label),
                    );
                  }).toList(),
                ),
              Expanded(
                child: Column(
                  children: [
                    const _TopBar(),
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int get _selectedIndex {
    final index = _items.indexWhere((item) => item.path == location);
    return index < 0 ? 0 : index;
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.selectedIndex, required this.onSelect});

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 22, 16, 26),
            child: _Brand(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(
              'WORKSPACE',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
          for (var i = 0; i < AppShell._items.length; i++)
            _SidebarItem(
              item: AppShell._items[i],
              selected: i == selectedIndex,
              onTap: () => onSelect(i),
            ),
          const Spacer(),
          const Divider(height: 1),
          const ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFE9EDFF),
              child: Text('JD', style: TextStyle(fontSize: 11, color: AppColors.primary)),
            ),
            title: Text('Jordan Davis', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            subtitle: Text('Workspace admin', style: TextStyle(fontSize: 11, color: AppColors.muted)),
            trailing: Icon(Icons.more_horiz, color: AppColors.muted),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: selected ? const Color(0xFFEEF1FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(7),
          child: SizedBox(
            height: 42,
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(item.icon, size: 19, color: selected ? AppColors.primary : AppColors.muted),
                const SizedBox(width: 12),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    color: selected ? AppColors.primary : AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          const Text('Acme Conversations', style: TextStyle(fontSize: 13, color: AppColors.muted)),
          const Spacer(),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded, size: 20),
          ),
          const SizedBox(width: 8),
          const _ProfileButton(),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(Icons.graphic_eq_rounded, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        const Text('voiceflow', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -0.5)),
      ],
    );
  }
}

class _ProfileButton extends StatelessWidget {
  const _ProfileButton();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 16,
      backgroundColor: Color(0xFFE9EDFF),
      child: Text('JD', style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w700)),
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.path, this.icon);
  final String label;
  final String path;
  final IconData icon;
}
