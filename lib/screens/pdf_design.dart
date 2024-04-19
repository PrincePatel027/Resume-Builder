import 'package:flutter/material.dart';
import 'package:resume_builder/utils/utils.dart';

class PdfDesign extends StatefulWidget {
  const PdfDesign({super.key});

  @override
  State<PdfDesign> createState() => _PdfDesignState();
}

class _PdfDesignState extends State<PdfDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${ContactInfoData.name ?? ''}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${ContactInfoData.currentDesignation ?? ''}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'CONTACT',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text('${ContactInfoData.phoneNum ?? ''}',
                  style: const TextStyle(fontSize: 12.0)),
              Text(
                '${ContactInfoData.email ?? ''}',
                style: const TextStyle(fontSize: 12.0),
              ),
              Text(
                '${ContactInfoData.address ?? ''}',
                style: const TextStyle(fontSize: 12.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'EDUCATION',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${ContactInfoData.courseDegree ?? ''}\n${ContactInfoData.schoolCollage ?? ''}\n${ContactInfoData.yearOfPass ?? ''}',
                style: TextStyle(fontSize: 12.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'EXPERTISE',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: ContactInfoData.technologiesList
                    .map((tech) => Chip(
                          label: Text(tech, style: TextStyle(fontSize: 12.0)),
                        ))
                    .toList(),
              ),
              SizedBox(height: 16.0),
              Text(
                'EXPERIENCE',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExperienceItem(
                    title:
                        '${ContactInfoData.dateJoined ?? ''} - ${ContactInfoData.dateExit ?? ''}',
                    company:
                        '${ContactInfoData.companyName ?? ''} | ${ContactInfoData.cityDeclaration ?? ''}',
                    position: '${ContactInfoData.designation ?? ''}',
                    description: '${ContactInfoData.description ?? ''}',
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'REFERENCE',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  ReferenceItem(
                    name: '${ContactInfoData.refranceName ?? ''}',
                    title: '${ContactInfoData.designation ?? ''}',
                    phone: '${ContactInfoData.phoneNum ?? ''}',
                    email: '${ContactInfoData.email ?? ''}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReferenceItem extends StatelessWidget {
  final String name;
  final String title;
  final String phone;
  final String email;

  const ReferenceItem({
    required this.name,
    required this.title,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              title,
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Phone: $phone',
              style: TextStyle(fontSize: 12.0),
            ),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String position;
  final String description;

  const ExperienceItem({
    required this.title,
    required this.company,
    required this.position,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0),
        Text(
          company,
          style: TextStyle(fontSize: 12.0),
        ),
        Text(
          position,
          style: TextStyle(fontSize: 12.0),
        ),
        SizedBox(height: 4.0),
        Text(
          description,
          style: TextStyle(fontSize: 10.0),
        ),
      ],
    );
  }
}
