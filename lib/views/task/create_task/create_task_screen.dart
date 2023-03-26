import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/icon_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/form_create_common.dart';
import 'package:todo_list/views/widgets/text_field_common.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      backgroundColor: ColorUtils.bgColor,
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          context.router.navigateBack();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorUtils.black,
        ),
      ),
      title: Text(
        L.current.createNewTaskTitle,
        style: TextStyleUtils.textStyleOpenSans20W400Black,
      ),
      backgroundColor: ColorUtils.bgColor,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              // TODO: add task to project
            },
            icon: const Icon(
              Icons.save,
              color: ColorUtils.black,
            )),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FormCreateCommon(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldTaskCommon(
                        L.current.priorityLabel,
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 10,
                                height: 10,
                                color: ColorUtils.greyED,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Low',
                              style: TextStyleUtils.textStyleOpenSans16W400,
                            )
                          ],
                        ),
                      ),
                      _fieldTaskCommon(
                        L.current.numberOfPomodoroLabel,
                        RatingBar(
                          initialRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: SvgPicture.asset(IconUtils.icPomodoroSmall),
                            empty: SvgPicture.asset(IconUtils.icPomodoroSmallOff),
                            half: SvgPicture.asset(IconUtils.icPomodoroSmallOff),
                          ),
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemSize: 24,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                          glow: false,
                        ),
                      ),
                      _fieldTaskCommon(
                        L.current.deadlineLabel,
                        TextFieldCommon(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          suffixIcon: const Icon(Icons.edit_calendar_rounded, color: ColorUtils.black,),
                          readOnly: true,
                          onTap: () {

                          },
                        ),
                      ),
                      _fieldTaskCommon(
                        L.current.projectLabel,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.greyED),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),

                          width: double.infinity,
                          height: 44,
                          child: DropdownButton(
                            value: 'Design UI/UX',
                            items: [
                              DropdownMenuItem(
                                child: Text('Design UI/UX'),
                                value: 'Design UI/UX',
                              ),
                            ],
                            onChanged: (value) {},
                            icon: Icon(Icons.expand_more_rounded),
                            borderRadius: BorderRadius.circular(5),
                            underline: const SizedBox(),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldTaskCommon(String label, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleUtils.textStyleOpenSans16W600Blue05,
        ),
        const SizedBox(
          height: 5,
        ),
        content,
      ],
    );
  }
}
