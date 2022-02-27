import 'package:astro/core/utils/app_textstyle.dart';
import 'package:astro/core/utils/colours.dart';
import 'package:astro/core/utils/uidata.dart';
import 'package:astro/features/profile/presentation/widgets/my_profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: _buildAppBarWidget(),
          titleSpacing: 0,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colours.white,
          bottom: TabBar(
            indicatorColor: Colors.orange,
            tabs: [
              Tab(
                child: Text(
                  'My Profile',
                  style: AppTextStyle.orange(),
                ),
              ),
              Tab(
                child: Text(
                  'Order Histroy',
                  style: AppTextStyle.orange(),
                ),
              ),
            ],
          ),
        ),
        body: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return TabBarView(
      children: [
        MyProfileWidget(),
        Container(),
      ],
    );
  }

  Widget _buildAppBarWidget() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              UIData.icon,
              width: 50,
              height: 50,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colours.white,
                side: const BorderSide(color: Colors.orange),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onPressed: () {},
              child: Text(
                'Logout',
                style: AppTextStyle.orange().merge(
                  const TextStyle(fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
