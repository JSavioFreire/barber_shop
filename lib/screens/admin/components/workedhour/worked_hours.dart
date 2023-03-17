import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:barber_shop/screens/admin/components/workedhour/widgets/each_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkedHours extends StatelessWidget {
  const WorkedHours({super.key});

  @override
  Widget build(BuildContext context) {
    ProfessionalDbProvider professionalDbProvider =
        Provider.of<ProfessionalDbProvider>(context);

    return Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: professionalDbProvider.listPro.length,
          itemBuilder: (context, index) => EachPro(
              loading: professionalDbProvider.loadingPro,
              pro: professionalDbProvider.listPro[index]),
        ));
  }
}
