import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendasDatepicker extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final IconData? icon;

  const VendasDatepicker({
    super.key,
    this.controller,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // final TargetPlatform _plataforma = Theme.of(context).platform;
    const TargetPlatform _plataforma = TargetPlatform.iOS;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon),
      ),
      readOnly: true,
      onTap: () async {
        if (_plataforma == TargetPlatform.iOS) {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  color: Colors.white,
                  height: 216,
                  child: SafeArea(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime date) {
                        print(date);
                      },
                    ),
                  ),
                );
              });
        } else {
          final date = await showDatePicker(
            locale: const Locale('pt', 'BR'),
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (date == null) {
            controller?.text = "";
          } else {
            controller?.text = "${date.day}/${date.month}/${date.year}";
          }
        }
      },
    );
  }
}
