import 'package:barber_shop/model/appointment.dart';
import 'package:barber_shop/provider/db/professional/professional_db_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentProvider extends ChangeNotifier {
  BuildContext context;
  AppointmentProvider({required this.context});
  FirebaseFirestore db = FirebaseFirestore.instance;

  late ProfessionalDbProvider professionalDbProvider =
      Provider.of<ProfessionalDbProvider>(context, listen: false);

  late List<AppointmentModel> listAppointment = [];
}
