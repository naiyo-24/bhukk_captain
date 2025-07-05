import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/app_bar.dart';
import '../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure HomeController is initialized
    Get.put(HomeController(), permanent: true);
    
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: DashboardAppBar(
        onNotifications: () {
          Get.snackbar(
            'Notifications',
            'No new notifications',
            backgroundColor: Colors.blue.shade50,
            colorText: Colors.blue.shade700,
          );
        },
        onEdit: () {
          Get.snackbar(
            'Edit Dashboard',
            'Dashboard customization coming soon',
            backgroundColor: Colors.green.shade50,
            colorText: Colors.green.shade700,
          );
        },
      ),
      body: SafeArea(
        child: Column(
          children: [

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Today's Stats
                    _buildSectionTitle('Today\'s Performance'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildStatCard(
                          title: 'Deliveries',
                          value: '8',
                          icon: Icons.local_shipping,
                          color: Colors.blue,
                        )),
                        const SizedBox(width: 12),
                        Expanded(child: _buildStatCard(
                          title: 'Earnings',
                          value: '\$45.20',
                          icon: Icons.monetization_on,
                          color: Colors.green,
                        )),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildStatCard(
                          title: 'Hours Online',
                          value: '6.5h',
                          icon: Icons.access_time,
                          color: Colors.orange,
                        )),
                        const SizedBox(width: 12),
                        Expanded(child: _buildStatCard(
                          title: 'Rating',
                          value: '4.8★',
                          icon: Icons.star,
                          color: Colors.amber,
                        )),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Weekly Performance
                    _buildSectionTitle('This Week'),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildWeeklyStat('Total Deliveries', '42', Icons.delivery_dining),
                          const Divider(),
                          _buildWeeklyStat('Total Earnings', '\$234.50', Icons.account_balance_wallet),
                          const Divider(),
                          _buildWeeklyStat('Online Hours', '38h', Icons.timer),
                          const Divider(),
                          _buildWeeklyStat('Average Rating', '4.7★', Icons.star_rate),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Recent Orders
                    _buildSectionTitle('Recent Orders'),
                    const SizedBox(height: 12),
                    _buildRecentOrderCard(
                      orderId: 'ORD001',
                      restaurant: 'Pizza Palace',
                      customer: 'John Doe',
                      amount: '\$25.99',
                      status: 'Delivered',
                      time: '2 hours ago',
                      statusColor: Colors.green,
                    ),
                    const SizedBox(height: 8),
                    _buildRecentOrderCard(
                      orderId: 'ORD002',
                      restaurant: 'Burger House',
                      customer: 'Jane Smith',
                      amount: '\$18.50',
                      status: 'In Progress',
                      time: '1 hour ago',
                      statusColor: Colors.orange,
                    ),
                    const SizedBox(height: 8),
                    _buildRecentOrderCard(
                      orderId: 'ORD003',
                      restaurant: 'Sushi Bar',
                      customer: 'Mike Johnson',
                      amount: '\$32.75',
                      status: 'Delivered',
                      time: '3 hours ago',
                      statusColor: Colors.green,
                    ),

                    const SizedBox(height: 24),

                    // Quick Actions
                    _buildSectionTitle('Quick Actions'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildActionCard(
                          title: 'Go Online',
                          icon: Icons.play_circle_outline,
                          color: Colors.green,
                          onTap: () {
                            Get.snackbar(
                              'Status Changed',
                              'You are now online',
                              backgroundColor: Colors.green.shade50,
                              colorText: Colors.green.shade700,
                            );
                          },
                        )),
                        const SizedBox(width: 12),
                        Expanded(child: _buildActionCard(
                          title: 'View Earnings',
                          icon: Icons.account_balance_wallet_outlined,
                          color: Colors.blue,
                          onTap: () {
                            Get.snackbar(
                              'Earnings',
                              'Total earnings: \$234.50',
                              backgroundColor: Colors.blue.shade50,
                              colorText: Colors.blue.shade700,
                            );
                          },
                        )),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildActionCard(
                          title: 'Support',
                          icon: Icons.support_agent,
                          color: Colors.purple,
                          onTap: () {
                            Get.snackbar(
                              'Support',
                              'Contacting support...',
                              backgroundColor: Colors.purple.shade50,
                              colorText: Colors.purple.shade700,
                            );
                          },
                        )),
                        const SizedBox(width: 12),
                        Expanded(child: _buildActionCard(
                          title: 'Settings',
                          icon: Icons.settings_outlined,
                          color: Colors.grey,
                          onTap: () {
                            Get.snackbar(
                              'Settings',
                              'Opening settings...',
                              backgroundColor: Colors.grey.shade50,
                              colorText: Colors.grey.shade700,
                            );
                          },
                        )),
                      ],
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOME);
          } else if (index == 2) {
            Get.toNamed(Routes.ACCOUNT);
          }
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyStat(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrderCard({
    required String orderId,
    required String restaurant,
    required String customer,
    required String amount,
    required String status,
    required String time,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.restaurant,
              color: Colors.orange,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderId,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  restaurant,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  customer,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
} 