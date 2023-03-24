import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextArea extends StatelessWidget {
  const TextArea({super.key});

  @override
  Widget build(BuildContext context) {
    DaysWorked daysWorked = Provider.of<DaysWorked>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              controller: daysWorked.userObs,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Fique a vontade para escrever alguma observação!',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
              minLines: 10,
              maxLines: 10,
              style: const TextStyle(color: ThemeColors.background),
            ),
          ),
        ],
      ),
    );
  }
}
