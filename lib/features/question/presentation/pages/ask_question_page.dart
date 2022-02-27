import 'dart:ui';

import 'package:astro/core/injection_container.dart';
import 'package:astro/core/utils/app_textstyle.dart';
import 'package:astro/core/utils/colours.dart';
import 'package:astro/core/utils/uidata.dart';
import 'package:astro/features/question/data/models/question_category_data.dart';
import 'package:astro/features/question/domain/repositories/question_repository.dart';
import 'package:astro/features/question/presentation/bloc/question_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AskQuestionPage extends StatefulWidget {
  AskQuestionPage({Key? key}) : super(key: key);

  @override
  State<AskQuestionPage> createState() => _AskQuestionPageState();
}

class _AskQuestionPageState extends State<AskQuestionPage> {
  var questionBloc = QuestionBloc(serviceLocator<QuestionRepository>());
  late QuestionCategoryData selectedValue;

  @override
  void initState() {
    super.initState();
    questionBloc.add(GetQuestionCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) {
          return questionBloc;
        },
        child: BlocBuilder<QuestionBloc, QuestionState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ask a Question',
                            style: AppTextStyle.blackBold().merge(
                              const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Seek accurate answers to your life problems and get guidance towards the right path. Whether the probem is related to love, self life, business, money, education or work, out astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.',
                            style: AppTextStyle.blackLight().merge(
                              const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Choose category',
                            style: AppTextStyle.blackBold().merge(
                              const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          //if (state is QuestionLoadingState) showLoaderDialog(context),
                          DropdownButtonFormField(
                            hint: const Text("Select"),
                            onChanged: (value) {
                              questionBloc.add(
                                CategorySelectionEvent(
                                    value as QuestionCategoryData),
                              );
                            },
                            items: dropdownItems(
                                state.data == null || state.data!.isEmpty
                                    ? []
                                    : state.data!),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            minLines: 3,
                            maxLines: 3,
                            maxLength: 150,
                            decoration: InputDecoration(
                              hintText: "Type a Question",
                              hintStyle: AppTextStyle.grey(),
                              counterStyle: AppTextStyle.grey(),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                          ),
                          Text(
                            'Ideas what to ask (Select any)',
                            style: AppTextStyle.blackBold().merge(
                              const TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                state.data != null && state.data!.isNotEmpty
                                    ? state.selectedCategory != null
                                        ? state.selectedCategory!.suggestions!
                                            .length
                                        : 0
                                    : 0,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.question_mark,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      state.selectedCategory!
                                          .suggestions![index],
                                      maxLines: 2,
                                      style: AppTextStyle.grey().merge(
                                        const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.grey,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildChargesWidget(state.selectedCategory),
              ],
            );
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<QuestionCategoryData>> dropdownItems(
      List<QuestionCategoryData> data) {
    List<DropdownMenuItem<QuestionCategoryData>> items =
        List.empty(growable: true);
    for (var element in data) {
      if (element.name != null) {
        items.add(DropdownMenuItem(
          child: Text(element.name!),
          value: element,
        ));
      }
    }
    return items;
  }

  Widget _buildChargesWidget(QuestionCategoryData? categoryData) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colours.blue,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '₹ ${categoryData == null ? "-" : categoryData.price} (1 Question on ${categoryData == null ? "-" : categoryData.name})',
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
              'Ask Now',
              style: AppTextStyle.blue().merge(
                const TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      content: CircularProgressIndicator(),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
