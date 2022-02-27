import 'package:astro/core/injection_container.dart';
import 'package:astro/core/utils/app_textstyle.dart';
import 'package:astro/core/utils/colours.dart';
import 'package:astro/features/profile/data/models/relative_data.dart';
import 'package:astro/features/profile/domain/repositories/profile_repository.dart';
import 'package:astro/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyProfileWidget extends StatefulWidget {
  MyProfileWidget({Key? key}) : super(key: key);

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  final ProfileBloc _profileBloc = ProfileBloc(
    serviceLocator<ProfileRepository>(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _profileBloc..add(GetRelativesEvent()),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is AllRelativeState) {
                      return _buildFriendWidget(state.data);
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFriendWidget(List<RelativeData>? data) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Text(
                    'Name',
                    style: AppTextStyle.blue(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'DOB',
                    style: AppTextStyle.blue(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'TOB',
                    style: AppTextStyle.blue(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Relation',
                    style: AppTextStyle.blue(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '',
                    style: AppTextStyle.blue(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '',
                    style: AppTextStyle.blue(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: data!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
              ),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Text(
                        data[index].firstName!,
                        style: AppTextStyle.grey(),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        parseUTC(data[index].dateAndTimeOfBirth!, "dd/MM/yy"),
                        style: AppTextStyle.grey(),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        data[index].firstName!,
                        style: AppTextStyle.grey(),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        data[index].relation!,
                        style: AppTextStyle.grey(),
                        textAlign: TextAlign.center,
                      ),
                      const Icon(
                        Icons.edit,
                        color: Colors.orange,
                        size: 16,
                      ),
                      const Icon(
                        Icons.delete,
                        color: Colors.orange,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  String parseUTC(String? date, String outputFormat) {
    if (date == null) {
      return "--";
    }
    var dateValue =
        new DateFormat("yyyy-MM-ddTHH:mm:SSZ").parseUTC(date).toLocal();
    String formattedDate = DateFormat(outputFormat).format(dateValue);
    return formattedDate;
  }
}
