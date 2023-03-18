import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BoxPrimary extends StatelessWidget {
  const BoxPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 20),
          decoration: BoxDecoration(
              color: ThemeColors.primary,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Promoção exclusiva',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                      child: Lottie.network(
                          'https://assets7.lottiefiles.com/packages/lf20_lBtFh1H88S.json'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '5',
                                style: TextStyle(
                                    fontSize: 55, color: Colors.black),
                              ),
                              Column(
                                children: const <Text>[
                                  Text(
                                    '%',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    'off',
                                    style: TextStyle(
                                        color: ThemeColors.background,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              )
                            ])),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RichText(
                        text: const TextSpan(
                            text: 'Promoção exclusiva de 5% para os ',
                            style: TextStyle(fontSize: 15),
                            children: [
                          TextSpan(
                              text: 'usuários logados ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'no aplicativo para todos os serviços.')
                        ])),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
