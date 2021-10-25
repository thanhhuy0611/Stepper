import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/common/drawer/cubit/drawer_cubit.dart';
import 'package:stepper/presentation/common/drawer/views/drawer_item.dart';
import 'package:stepper/routes.dart';

class DrawerData {
  final String drawerTitle;
  final IconData drawerIcon;
  final DrawerType drawerType;

  DrawerData({
    required this.drawerTitle,
    required this.drawerIcon,
    required this.drawerType,
  });
}

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);
  final List<DrawerData> _drawerList = [
    DrawerData(
      drawerTitle: home,
      drawerIcon: Icons.home,
      drawerType: DrawerType.home,
    ),
    DrawerData(
      drawerTitle: area,
      drawerIcon: Icons.article_outlined,
      drawerType: DrawerType.area,
    ),
    DrawerData(
      drawerTitle: calendar,
      drawerIcon: Icons.calendar_today,
      drawerType: DrawerType.calendar,
    ),
  ];

  void _onDrawerClosed(BuildContext context) {
    Navigator.of(context).pop();
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    return _drawerList
        .map((drawer) => DrawerItem(
              drawerTitle: drawer.drawerTitle,
              drawerIcon: drawer.drawerIcon,
              drawerType: drawer.drawerType,
            ))
        .toList();
  }

  void _onHomeScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Routes.home,
    );
  }

  void _onAreaScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Routes.area,
    );
  }

  void _onCalendarScreenTap(BuildContext context) {
    //TODO implement calendar tap here
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {
        if (state.selectedItem == DrawerType.home) {
          _onHomeScreenTap(context);
        } else if (state.selectedItem == DrawerType.area) {
          _onAreaScreenTap(context);
        } else {
          _onCalendarScreenTap(context);
        }
      },
      builder: (context, state) => SafeArea(
        child: Drawer(
          child: Container(
            color: mediumGrey,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      avatarProfileUrl,
                    ),
                  ),
                  title: const Text('John Doe'),
                  trailing: IconButton(
                    onPressed: () => _onDrawerClosed(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                ..._buildDrawerItems(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}