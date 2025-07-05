import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/app_bar.dart';
import '../../controllers/account_controller.dart';
import '../../routes/app_pages.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountController;
    try {
      accountController = Get.find<AccountController>();
    } catch (e) {
      accountController = Get.put(AccountController(), permanent: true);
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AccountAppBar(
        onEdit: () => accountController.navigateToEditAccount(),
      ),
      body: SafeArea(
        child: Column(
          children: [

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Profile Card
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
                          // Profile Picture
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.orange.shade200,
                                width: 3,
                              ),
                            ),
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.orange.shade700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          
                          // Name and Phone
                          const Text(
                            'Delivery Partner',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Obx(() => Text(
                            accountController.phoneNumber.value,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          )),
                          const SizedBox(height: 16),
                          
                          // Status Badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green.shade200),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green.shade700,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Verified Partner',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Account Stats
                    Row(
                      children: [
                        Expanded(child: _buildAccountStatCard(
                          title: 'Total Deliveries',
                          value: '156',
                          icon: Icons.local_shipping,
                          color: Colors.blue,
                        )),
                        const SizedBox(width: 12),
                        Expanded(child: _buildAccountStatCard(
                          title: 'Total Earnings',
                          value: '\$1,234',
                          icon: Icons.monetization_on,
                          color: Colors.green,
                        )),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildAccountStatCard(
                          title: 'Rating',
                          value: '4.8★',
                          icon: Icons.star,
                          color: Colors.amber,
                        )),
                        const SizedBox(width: 12),
                        Expanded(child: _buildAccountStatCard(
                          title: 'Member Since',
                          value: '3 months',
                          icon: Icons.calendar_today,
                          color: Colors.purple,
                        )),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Account Options
                    _buildSectionTitle('Account Settings'),
                    const SizedBox(height: 12),
                    _buildOptionCard(
                      title: 'Personal Information',
                      subtitle: 'Update your profile details',
                      icon: Icons.person_outline,
                      onTap: () => accountController.navigateToEditAccount(),
                    ),
                    _buildOptionCard(
                      title: 'Payment Methods',
                      subtitle: 'Manage your payment options',
                      icon: Icons.payment_outlined,
                      onTap: () {
                        Get.snackbar(
                          'Payment',
                          'Payment methods feature coming soon',
                          backgroundColor: Colors.green.shade50,
                          colorText: Colors.green.shade700,
                        );
                      },
                    ),
                    _buildOptionCard(
                      title: 'Notifications',
                      subtitle: 'Configure notification preferences',
                      icon: Icons.notifications_outlined,
                      onTap: () {
                        Get.snackbar(
                          'Notifications',
                          'Notification settings feature coming soon',
                          backgroundColor: Colors.orange.shade50,
                          colorText: Colors.orange.shade700,
                        );
                      },
                    ),
                    _buildOptionCard(
                      title: 'Privacy & Security',
                      subtitle: 'Manage your privacy settings',
                      icon: Icons.security_outlined,
                      onTap: () {
                        Get.snackbar(
                          'Privacy',
                          'Privacy settings feature coming soon',
                          backgroundColor: Colors.purple.shade50,
                          colorText: Colors.purple.shade700,
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Support & Help
                    _buildSectionTitle('Support & Help'),
                    const SizedBox(height: 12),
                    _buildOptionCard(
                      title: 'Help Center',
                      subtitle: 'Get help and support',
                      icon: Icons.help_outline,
                      onTap: () {
                        Get.snackbar(
                          'Help',
                          'Help center feature coming soon',
                          backgroundColor: Colors.blue.shade50,
                          colorText: Colors.blue.shade700,
                        );
                      },
                    ),
                    _buildOptionCard(
                      title: 'Contact Support',
                      subtitle: 'Reach out to our support team',
                      icon: Icons.support_agent_outlined,
                      onTap: () {
                        Get.snackbar(
                          'Support',
                          'Contacting support...',
                          backgroundColor: Colors.green.shade50,
                          colorText: Colors.green.shade700,
                        );
                      },
                    ),
                    _buildOptionCard(
                      title: 'Terms & Conditions',
                      subtitle: 'Read our terms of service',
                      icon: Icons.description_outlined,
                      onTap: () {
                        Get.snackbar(
                          'Terms',
                          'Terms and conditions feature coming soon',
                          backgroundColor: Colors.grey.shade50,
                          colorText: Colors.grey.shade700,
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Logout Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text('Logout'),
                              content: const Text('Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('Cancel'),
                                ),
                                                                  ElevatedButton(
                                    onPressed: () => accountController.logout(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Logout'),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOME);
          } else if (index == 1) {
            Get.toNamed(Routes.DASHBOARD);
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

  Widget _buildAccountStatCard({
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
              fontSize: 18,
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

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.orange,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
} 