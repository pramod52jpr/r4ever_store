import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:r4everstore/ui/home/home_screen.dart';
import 'package:r4everstore/ui/home/profile_screen.dart';
import 'package:r4everstore/ui/home/task_screen.dart';
import 'package:r4everstore/ui/home/team_screen.dart';
import 'package:r4everstore/ui/home/vip_screen.dart';
import 'package:r4everstore/utils/constant.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {

  ValueNotifier<int> currentIndex = ValueNotifier(0);

  List pages = [
    const HomeScreen(),
    const TaskScreen(),
    const VipScreen(),
    const TeamScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, index, child) {
          return pages[index];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, index, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomTab(
                      iconData: PhosphorIcons.house,
                      label: "Home",
                      onTap: () {
                        currentIndex.value = 0;
                      },
                      selected: index == 0,
                    ),
                    BottomTab(
                      iconData: Icons.task_alt_outlined,
                      label: "My Task",
                      onTap: () {
                        currentIndex.value = 1;
                      },
                      selected: index == 1,
                    ),
                    BottomTab(
                      iconData: PhosphorIcons.crown,
                      label: "VIP",
                      onTap: () {
                        currentIndex.value = 2;
                      },
                      selected: index == 2,
                    ),
                    BottomTab(
                      iconData: PhosphorIcons.users,
                      label: "Team",
                      onTap: () {
                        currentIndex.value = 3;
                      },
                      selected: index == 3,
                    ),
                    BottomTab(
                      iconData: PhosphorIcons.user,
                      label: "My",
                      onTap: () {
                        currentIndex.value = 4;
                      },
                      selected: index == 4,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      )
    );
  }
}


class BottomTab extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool selected;
  const BottomTab({super.key, required this.label, required this.iconData, required this.onTap, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 200),
      offset: selected ? const Offset(0, -0.2) : const Offset(0, 0),
      child: InkWell(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, color: selected ? K.secondaryColor : Colors.black),
            Text(label, style: TextStyle(color: selected ? K.secondaryColor : Colors.black))
          ],
        ),
      ),
    );
  }
}
