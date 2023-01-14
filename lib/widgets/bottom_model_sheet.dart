//Model bottom Sheet for adding New card

import 'package:flutter/material.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/widgets/custom_text_field.dart';

Future showBottomModelSheet(BuildContext context, Function function,
    {String? title, String? subtitle}) async {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final isUpdateCard = title != null && subtitle != null;
  if (title != null) {
    titleController.text = title;
  }
  if (subtitle != null) {
    subtitleController.text = subtitle;
  }

  showModalBottomSheet(
      context: context,
      backgroundColor: kSecondaryColor,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        maxWidth: 350,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    isUpdateCard
                        ? "Update Card Details"
                        : "Add New Card details",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: titleController,
                    hintText: "Enter Title",
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter title";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: subtitleController,
                    hintText: "Enter Description",
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter subtitle";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        function(titleController.text, subtitleController.text);
                        Navigator.pop(context, true);
                      }
                    },
                    child: Text(
                      isUpdateCard ? "Update Card" : "Add Card",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
