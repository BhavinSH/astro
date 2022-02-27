import 'package:astro/core/utils/app_textstyle.dart';
import 'package:astro/core/utils/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfileWidget extends StatefulWidget {
  MyProfileWidget({Key? key}) : super(key: key);

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, right: 4, left: 4),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Basic Profile',
                  style: AppTextStyle.black(),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.orange,
                  ),
                  child: Text(
                    'Friends and Family Profile',
                    style: AppTextStyle.white(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.wallet_giftcard_rounded,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Wallet Balance: ₹ 0',
                  style: AppTextStyle.blue(),
                ),
                SizedBox(
                  width: 10,
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
          ),
          SizedBox(
            height: 16,
          ),
          _buildFriendWidet()
        ],
      ),
    );
  }

  Widget _buildFriendWidet() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Text(
                    'Name',
                    style: AppTextStyle.blue(),
                  ),
                  Text(
                    'DOB',
                    style: AppTextStyle.blue(),
                  ),
                  Text(
                    'TOB',
                    style: AppTextStyle.blue(),
                  ),
                  Text(
                    'Relation',
                    style: AppTextStyle.blue(),
                  ),
                  Text(''),
                  Text(''),
                ],
              ),
            ],
          ),
          ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Table(
                children: [
                  TableRow(
                    children: [
                      Text(
                        "data",
                        style: AppTextStyle.black(),
                      ),
                      Text(
                        "data",
                        style: AppTextStyle.black(),
                      ),
                      Text(
                        "data",
                        style: AppTextStyle.black(),
                      ),
                      Text(
                        "data",
                        style: AppTextStyle.black(),
                      ),
                      Text(
                        "data",
                        style: AppTextStyle.black(),
                      ),
                      Text(
                        "data",
                        style: AppTextStyle.black(),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
