import 'package:flutter/material.dart';
import 'package:resume_builder/screens/archivements.dart';
import 'package:resume_builder/screens/carrier_objective.dart';
import 'package:resume_builder/screens/contact_info.dart';
import 'package:resume_builder/screens/declaration.dart';
import 'package:resume_builder/screens/education.dart';
import 'package:resume_builder/screens/experience.dart';
import 'package:resume_builder/screens/home_page.dart';
import 'package:resume_builder/screens/pdf_design.dart';
import 'package:resume_builder/screens/personal_detail.dart';
import 'package:resume_builder/screens/projects.dart';
import 'package:resume_builder/screens/refrences.dart';
import 'package:resume_builder/screens/resume_workspace.dart';
import 'package:resume_builder/screens/splash_screen.dart';
import 'package:resume_builder/screens/technical_skill.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const HomePage(),
        'resumeWorkspace': (context) => const ResumeWorkspace(),
        'contactInfo': (context) => const ContactInfo(),
        'carrierObjective': (context) => const CarrierObjective(),
        'personDetails': (context) => const PersonalDetailPage(),
        'splash_screen': (context) => const SplashScreen(),
        'education_page': (context) => const Education(),
        'experience_page': (context) => const ExperiencePage(),
        'technical_skill_page': (context) => const TechnicalSkill(),
        'projects_page': (context) => const ProjectsPage(),
        'archivements_page': (context) => const Archivements(),
        'refrences_page': (context) => const Refrences(),
        'declaration_page': (context) => const Declaration(),
        'pdf': (context) => const PdfDesign(),
      },
    ),
  );
}
