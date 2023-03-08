import 'package:barber_shop/screens/home/components/all_services/widgets/each_service.dart';
import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Serviços',
              style: TextStyle(color: ThemeColors.background, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <EachService>[
                        EachService(
                          name: 'Corte',
                          image: 'assets/scissor.jpg',
                        ),
                        EachService(
                          name: 'Barba',
                          image: 'assets/barber.jpg',
                        ),
                        EachService(
                          name: 'Secagem',
                          image: 'assets/hair.jpg',
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <EachService>[
                      EachService(
                        name: 'Maquina',
                        image: 'assets/mac.jpg',
                      ),
                      EachService(
                        name: 'Lavagem',
                        image: 'assets/clean.jpg',
                      ),
                      EachService(
                        name: 'Escova',
                        image: 'assets/prog.jpg',
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
