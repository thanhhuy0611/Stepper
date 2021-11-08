import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/views/create_goal_list.dart';

class CreatePostInput extends StatelessWidget {
  final CreatePostMode mode;
  const CreatePostInput({
    Key? key,
    required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return mode == CreatePostMode.writeUpdate
        ? Container(
            padding: const EdgeInsets.only(right: screenMediumPadding),
            constraints: BoxConstraints(minHeight: screenSize.height * 0.25),
            child: TextFormField(
              controller: context.read<CreatePostCubit>().writeUpdateController,
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: writeUpdateHint,
                hintStyle: TextStyle(color: mediumGrey),
              ),
            ),
          )
        : Container(
            constraints: BoxConstraints(minHeight: screenSize.height * 0.25),
            child: const CreateGoalList(),
          );
  }
}