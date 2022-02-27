import 'package:astro/core/utils/app_textstyle.dart';
import 'package:astro/core/utils/colours.dart';
import 'package:astro/features/profile/presentation/pages/profile_page.dart';
import 'package:astro/features/question/presentation/pages/ask_question_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:astro/core/utils/uidata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBodyWidget()),
      bottomNavigationBar: _buildBottomNavigationWidget(),
    );
  }

  Widget _buildBottomNavigationWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            UIData.home,
            height: 20,
            width: 20,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            UIData.talk,
            height: 20,
            width: 20,
          ),
          label: 'Talk',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            UIData.ask,
            height: 20,
            width: 20,
          ),
          label: 'Ask Question',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            UIData.reports,
            height: 20,
            width: 20,
          ),
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            UIData.chat,
            height: 20,
            width: 20,
          ),
          label: 'Chat',
        )
      ],
    );
  }

  Widget _buildAppBarWidget() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            UIData.hamburger,
          ),
          Expanded(
            child: Image.asset(
              UIData.icon,
              width: 50,
              height: 50,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Image.asset(
              UIData.profile,
              width: 25,
              height: 25,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAppBarWidget(),
        _buildWalletWidget(),
        AskQuestionPage(),
      ],
    );
  }

  Widget _buildWalletWidget() {
    return Container(
      color: Colours.blue,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Wallet Balance : ₹ 0',
            style: AppTextStyle.white().merge(
              const TextStyle(fontSize: 16),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colours.white,
              side: const BorderSide(color: Colours.black),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {},
            child: Text(
              'Add Money',
              style: AppTextStyle.blue().merge(
                const TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
