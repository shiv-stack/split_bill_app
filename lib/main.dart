import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:split_bill_app/app.dart';
import 'package:split_bill_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SplitBillApp());
}
