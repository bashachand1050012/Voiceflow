import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1440),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Overview', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.8)),
              const SizedBox(height: 6),
              const Text('A snapshot of your customer conversations.', style: TextStyle(color: AppColors.muted, fontSize: 14)),
              const SizedBox(height: 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 1000 ? 4 : constraints.maxWidth >= 620 ? 2 : 1;
                  const metrics = [
                    _Metric('Total calls', '1,284', '+12.8%', Icons.call_outlined),
                    _Metric('Conversations', '946', '+8.2%', Icons.forum_outlined),
                    _Metric('Avg. call duration', '04:32', '+3.1%', Icons.schedule_outlined),
                    _Metric('AI insights generated', '782', '+16.4%', Icons.auto_awesome_outlined),
                  ];
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: metrics.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      mainAxisExtent: 126,
                    ),
                    itemBuilder: (context, index) => _MetricTile(metric: metrics[index]),
                  );
                },
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Recent activity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    const Text('Your latest customer conversations will appear here.', style: TextStyle(fontSize: 13, color: AppColors.muted)),
                    const SizedBox(height: 22),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          children: [
                            Icon(Icons.forum_outlined, size: 30, color: Colors.blueGrey.shade200),
                            const SizedBox(height: 12),
                            const Text('No conversation activity yet', style: TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 5),
                            const Text('Connect your conversation data source to get started.', style: TextStyle(fontSize: 12, color: AppColors.muted), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Sample figures shown for layout preview. Connect a data source before using these metrics operationally.', style: TextStyle(fontSize: 11, color: AppColors.muted)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Metric {
  const _Metric(this.label, this.value, this.change, this.icon);
  final String label;
  final String value;
  final String change;
  final IconData icon;
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.metric});
  final _Metric metric;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(metric.label, style: const TextStyle(fontSize: 12, color: AppColors.muted))),
              Icon(metric.icon, size: 17, color: AppColors.muted),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(metric.value, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: -0.7)),
              const Spacer(),
              Text(metric.change, style: const TextStyle(fontSize: 11, color: AppColors.success, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
