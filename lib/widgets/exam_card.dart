import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/exam.dart';
class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  String formattedDate() {
    return DateFormat('d MMM, HH:mm ').format(exam.dateTime);
  }
  @override
  Widget build(BuildContext context) {
    final cardcolor = exam.dateTime.day == DateTime.now().day ? Colors.yellow.shade200
        : (exam.dateTime.isAfter(DateTime.now())) ? Colors.greenAccent.shade100 : Colors.blueGrey.shade50;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            "/details",
            arguments: {'exam':ExamCard(exam: exam), 'color':cardcolor},
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white12, width: 3),
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: cardcolor,
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(exam.name, style: TextStyle(color:Colors.black87 ,fontSize: 25, fontWeight: FontWeight.bold)),
              Divider(color: Colors.black, ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, color: Colors.black54, size: 16),
                  SizedBox(width: 8),
                  Text(formattedDate(), style: TextStyle(color: Colors.black87, fontSize: 14)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school_outlined, color: Colors.black54, size: 16),
                  SizedBox(width: 4),
                  Text('Locations: ${exam.classrooms.join(', ')}',
                      style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

