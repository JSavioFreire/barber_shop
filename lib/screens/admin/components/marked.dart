import 'package:barber_shop/provider/time/time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Marked extends StatelessWidget {
  const Marked({super.key});

  @override
  Widget build(BuildContext context) {
    Time time = Provider.of<Time>(context);

    var teste = time.currentDateHour();
    print(teste);
    
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 2, crossAxisSpacing: 2),
        itemBuilder: ((context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Text>[
                    Text('Hoje'),
                    Text('5:30'),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
