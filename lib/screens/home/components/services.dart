import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Serviços',
                style: TextStyle(color: ThemeColors.background, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
