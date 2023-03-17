import 'package:barber_shop/functions/current_date.dart';
import 'package:barber_shop/model/professional.dart';
import 'package:barber_shop/provider/db/days_worked/days_worked_provider.dart';
import 'package:barber_shop/screens/admin/components/workedhour/widgets/each_day.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EachPro extends StatelessWidget {
  final ProfessionalModel pro;
  final bool loading;
  const EachPro({super.key, required this.pro, required this.loading});

  @override
  Widget build(BuildContext context) {
    DaysWorked daysWorked = Provider.of<DaysWorked>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: loading
          ? const CircularProgressIndicator()
          : Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pro.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text('Marque os dias que vai trabalhar.')
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemCount: 10,
                        itemBuilder: (context, index) =>
                            daysWorked.listDayWork.isNotEmpty &&
                                    daysWorked.loading
                                ? LottieBuilder.asset(
                                    'assets/loading_skeleton.json')
                                : EachDay(
                                    date: CurrentDate()
                                        .currentDateHour()
                                        .add(Duration(days: index)),
                                    pro: pro,
                                  )),
                  )
                ],
              )),
    );
  }
}
