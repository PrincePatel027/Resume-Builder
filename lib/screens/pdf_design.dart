import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_builder/utils/utils.dart';

class PdfDesign extends StatelessWidget {
  const PdfDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeData = ResumeData(
      name: ContactInfoData.name,
      email: ContactInfoData.email,
      phoneNum: ContactInfoData.phoneNum,
      address: ContactInfoData.address,
      imagePath: ContactInfoData.imagePath,
      careerObjective: ContactInfoData.careerObjective,
      currentDesignation: ContactInfoData.currentDesignation,
      dateOfBirth: ContactInfoData.dateOfBirth,
      maritalStatus: ContactInfoData.maritalStatus,
      languageKnown: ContactInfoData.languageKnown,
      nationality: ContactInfoData.nationality,
      courseDegree: ContactInfoData.courseDegree,
      schoolCollage: ContactInfoData.schoolCollage,
      percentage: ContactInfoData.percentage,
      yearOfPass: ContactInfoData.yearOfPass,
      companyName: ContactInfoData.companyName,
      work: ContactInfoData.work,
      rolesOptional: ContactInfoData.rolesOptional,
      employeeStatus: ContactInfoData.employeeStatus,
      dateJoined: ContactInfoData.dateJoined,
      dateExit: ContactInfoData.dateExit,
      projectTitle: ContactInfoData.projectTitle,
      technologiesList: ContactInfoData.technologiesList,
      roles: ContactInfoData.roles,
      technologys: ContactInfoData.technologys,
      projectDescription: ContactInfoData.projectDescription,
      refranceName: ContactInfoData.refranceName,
      designation: ContactInfoData.designation,
      organizationInstitude: ContactInfoData.organizationInstitude,
      description: ContactInfoData.description,
      dateDeclaration: ContactInfoData.dateDeclaration,
      cityDeclaration: ContactInfoData.cityDeclaration,
    );

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            generateAndSavePDF(resumeData);
          },
          child: const Text('Generate PDF'),
        ),
      ),
    );
  }

  Future<void> generateAndSavePDF(ResumeData resumeData) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                padding:
                    const pw.EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: pw.BoxDecoration(
                  color: PdfColors.amber,
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                child: pw.Text(
                  "${resumeData.name}",
                  style: pw.TextStyle(
                    fontSize: 24.0,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Text(
                "${resumeData.currentDesignation}",
                style: pw.TextStyle(
                  fontSize: 18.0,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
              pw.SizedBox(height: 16.0),
              pw.Text(
                'CONTACT',
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Text("${resumeData.phoneNum}",
                  style: const pw.TextStyle(fontSize: 12.0)),
              pw.Text("${resumeData.email}",
                  style: const pw.TextStyle(fontSize: 12.0)),
              pw.Text("${resumeData.address}",
                  style: const pw.TextStyle(fontSize: 12.0)),
              pw.SizedBox(height: 16.0),
              pw.Text(
                'EDUCATION',
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Bullet(
                text:
                    '* ${resumeData.courseDegree}\n* ${resumeData.schoolCollage}\n* ${resumeData.yearOfPass}',
              ),
              pw.SizedBox(height: 16.0),
              pw.Text(
                'EXPERTISE',
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Column(
                children: [
                  ...resumeData.technologiesList.map(
                    (e) {
                      return pw.Row(
                        children: [
                          pw.SizedBox(width: 80),
                          pw.Text(e),
                        ],
                      );
                    },
                  )
                ],
              ),
              pw.SizedBox(height: 16.0),
              pw.Text(
                'EXPERIENCE',
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '${resumeData.dateJoined} - ${resumeData.dateExit}',
                    style: pw.TextStyle(
                        fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    '${resumeData.companyName ?? ''} | ${resumeData.cityDeclaration ?? ''}',
                    style: const pw.TextStyle(fontSize: 12.0),
                  ),
                  pw.Text(
                    resumeData.designation ?? '',
                    style: const pw.TextStyle(fontSize: 12.0),
                  ),
                  pw.Text(
                    resumeData.description ?? '',
                    style: const pw.TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
              pw.SizedBox(height: 16.0),
              pw.Text(
                'REFERENCE',
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Row(
                children: [
                  pw.Container(
                    padding: const pw.EdgeInsets.all(8.0),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.grey),
                      borderRadius: pw.BorderRadius.circular(8.0),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "${resumeData.name}",
                          style: pw.TextStyle(
                              fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                        ),
                        pw.SizedBox(height: 4.0),
                        pw.Text(
                          "${resumeData.projectTitle}",
                          style: const pw.TextStyle(fontSize: 12.0),
                        ),
                        pw.SizedBox(height: 4.0),
                        pw.Text(
                          'Phone: ${resumeData.phoneNum}',
                          style: const pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        pw.Text(
                          'Email: ${resumeData.email}',
                          style: const pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/first.pdf");

    await file.writeAsBytes(await pdf.save());
  }
}
