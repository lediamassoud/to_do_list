import 'package:flutter/material.dart';
import 'package:to_do_list/extention_function/extention_function_l10n.dart';
import 'package:to_do_list/utilities/app_theme.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(context.l10n.add_new_task,
              style: AppTheme.bottomSheetTextStyle,
              textAlign: TextAlign.center),
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: context.l10n.title),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: context.l10n.description,
            ),
          ),
          Text(context.l10n.select_time),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                showMyDatePicker();
              },
              child: Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                textAlign: TextAlign.center,
                style: AppTheme.taskDescriptionTextStyle,
              )),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: Text(context.l10n.add))
        ],
      ),
    );
  }

  void showMyDatePicker() async {
    selectedDate = (await showDatePicker(
            context: context,
            initialDate: selectedDate,
            //this date that appears when open the calender
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate);
    setState(() {});
  }
}
