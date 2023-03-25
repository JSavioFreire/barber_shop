import 'package:barber_shop/components/header/header.dart';
import 'package:barber_shop/components/header/widgets/icon_back.dart';
import 'package:barber_shop/components/header/widgets/icon_menu.dart';
import 'package:barber_shop/components/my_scaffold/my_scaffold.dart';
import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/screens/user/each_hours/widgets/button_mark.dart';
import 'package:barber_shop/screens/user/each_hours/widgets/row_text.dart';
import 'package:barber_shop/screens/user/each_hours/widgets/text_area.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class EachHoursScreen extends StatelessWidget {
  const EachHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final allArg = arg['daysWorked'];
    final date = arg['toDate'];

    return MyScaffold(
        backgroundColor: ThemeColors.background,
        inside: SingleChildScrollView(
          child: Column(children: [
            Header(
                headerLeft: const IconBack(
                  color: Colors.white,
                ),
                headerCenter: Text(CurrentDate().todayOrTomorrow(date),
                    style: const TextStyle(fontSize: 20)),
                headerRight: const IconMenu(color: Colors.white)),
            RowTextEachHour(
              allArg: allArg,
            ),
            const TextArea(),
            const Text(
                'Por favor, marque somente se tiver certeza que poderar comparecer!'),
            ButtonMark(allArg: allArg)
          ]),
        ));
  }
}
