import 'package:barber_shop/screens/home/components/hour/widgets/each_hour.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Hour extends StatelessWidget {
  const Hour({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: ThemeColors.secondary,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Próximos horário disponíveis',
                    style:
                        TextStyle(color: ThemeColors.background, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_jlMuwc2HNI.json'),
                ),
              ],
            ),
            Expanded(
                child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) => index == 7
                  ? ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ver',
                            style: TextStyle(color: Colors.white),
                          ),
                          Lottie.network(
                              'https://assets4.lottiefiles.com/packages/lf20_44xvkxqy.json',
                              repeat: false)
                        ],
                      ))
                  : const EachHour(
                      day: 'hoje',
                      hour: '5',
                    )),
            ))
          ],
        ),
      ),
    );
  }
}
