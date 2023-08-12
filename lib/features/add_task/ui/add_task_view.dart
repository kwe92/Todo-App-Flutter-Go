import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/add_task/ui/add_task_view_model.dart';
import 'package:flutter_golang_yt/features/add_task/ui/widgets/add_task_text_form_field.dart';
import 'package:flutter_golang_yt/features/home/widgets/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:provider/provider.dart';

// TODO: finish completing view

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskNameController = context.watch<AddTaskViewModel>().taskNameController;
    final taskDetailController = context.watch<AddTaskViewModel>().taskDetailController;

    return BasseScaffold(
      // showAppBar: true,
      title: 'Add Task View',
      child: Stack(children: [
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          // TODO: figure out if we can make the image longer or not
          decoration: _backgroundImage,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3.5,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              // TODO: I dont like the spacing it looks off
              children: [
                AddTaskTextForField(
                  controller: taskNameController,
                  rounding: Radius.circular(MediaQuery.of(context).size.width / 2),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                // TODO: I dont like how AddTaskTextForField is implemented
                AddTaskTextForField(
                  maxLines: 3,
                  controller: taskDetailController,
                  rounding: const Radius.circular(20),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  text: 'Add',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Container(
          // TODO: keep playing with the height
          height: MediaQuery.of(context).size.height / 12,
          // TODO: remove color when you are done ans turn into a SizedBox
          // color: Colors.orange,
          child: GestureDetector(
            onTap: () => appRouter.pop(),
            child: const Icon(
              // TODO: dynamically size this widget
              size: 50,
              Icons.arrow_left,
            ),
          ),
        ),
      ]),
    );
  }
}

const _backgroundImage = BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage('assets/images/addtask1.jpg'),
  ),
);
