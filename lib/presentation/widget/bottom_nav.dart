import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const BottomNav({
    Key? key,
    required this.activeTab,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // กำหนดรายการ Tab
    final List<Map<String, dynamic>> tabs = [
      {'id': 'home', 'label': 'Home', 'icon': Icons.home},
      {'id': 'map', 'label': 'Map', 'icon': Icons.map},
      {'id': 'create', 'label': 'Create', 'icon': Icons.add_circle},
      {'id': 'budget', 'label': 'Budget', 'icon': Icons.account_balance_wallet},
      {'id': 'profile', 'label': 'Profile', 'icon': Icons.person},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tabs.map((tab) {
            final String id = tab['id'];
            final String label = tab['label'];
            final IconData icon = tab['icon'];

            final bool isActive = activeTab == id;
            final bool isCreate = id == 'create';

            return GestureDetector(
              onTap: () => onTabChange(id),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  // ถ้าเป็นปุ่ม Create ให้ใส่สีพื้นหลัง (Primary)
                  color: isCreate ? Colors.teal : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isCreate
                      ? [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: isCreate ? 28 : 24,
                      color: isCreate
                          ? Colors
                                .white // สีไอคอนบนปุ่ม Create
                          : (isActive ? Colors.teal : Colors.grey),
                    ),
                    // ถ้าไม่ใช่ปุ่ม Create ให้แสดงตัวหนังสือ
                    if (!isCreate)
                      Text(
                        label,
                        style: GoogleFonts.inter(
                          // ใช้ Inter Font ตรงนี้
                          fontSize: 14,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isActive ? Colors.teal : Colors.grey.shade500,
                          letterSpacing: 1, // ปรับระยะห่างตัวอักษรให้ดูแพง
                        ),
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
