import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './app/my_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Connexion à Supabase
  await Supabase.initialize(
    url: 'https://baeikdtvfqvenwltxrrq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJhZWlrZHR2ZnF2ZW53bHR4cnJxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA1ODA0OTEsImV4cCI6MjA4NjE1NjQ5MX0.VDyzrjjoaFhhBYSA-KVmksQ3wdSXn0JFnhtVRXSeRPM'
  );
  
  runApp(
    const ProviderScope(child: MyApp())
  );
}