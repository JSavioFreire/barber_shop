import 'package:barber_shop/screens/home/components/professionals/widgets/each_professional.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Professionals extends StatelessWidget {
  const Professionals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profissionais',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 80,
                child: LottieBuilder.network(
                    'https://assets2.lottiefiles.com/packages/lf20_xdveeu5t.json'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <EachProfessional>[
              EachProfessional(
                name: 'Barney',
                image: 'assets/pro1.png',
              ),
              EachProfessional(
                name: 'Leopoldo',
                image: 'assets/pro2.png',
              ),
              EachProfessional(
                name: 'Vigário',
                image: 'assets/pro3.png',
              )
            ],
          ),
        )
      ],
    );
  }
}
