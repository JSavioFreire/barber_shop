import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:barber_shop/screens/home/components/professionals/widgets/each_professional.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Professionals extends StatelessWidget {
  const Professionals({super.key});

  @override
  Widget build(BuildContext context) {
    ProfessionalDbProvider professionalDbProvider =
        Provider.of<ProfessionalDbProvider>(context);

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
                  'https://assets2.lottiefiles.com/packages/lf20_xdveeu5t.json',
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: professionalDbProvider.loadingPro
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 3; i++)
                      ClipOval(
                        child: Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(211, 211, 211, 1),
                              borderRadius: BorderRadius.circular(35)),
                          child: Lottie.asset('assets/loading_skeleton.json',
                              fit: BoxFit.cover),
                        ),
                      )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <EachProfessional>[
                    for (int i = 0; i < 3; i++)
                      EachProfessional(
                        name: professionalDbProvider.listPro[i].name,
                        image: professionalDbProvider.listPro[i].urlImage,
                      ),
                  ],
                ),
        )
      ],
    );
  }
}
