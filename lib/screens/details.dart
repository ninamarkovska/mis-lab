import 'package:flutter/material.dart';
import 'package:mis_lab/widgets/exam_card.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final examCard = args['exam'] as ExamCard;
    final bgColor = args['color'] as Color;

    Duration remaining = examCard.exam.dateTime.difference(DateTime.now());
    int daysUntil = remaining.inDays;
    int hoursUntil = remaining.inHours % 24;

    String displayRemaining = remaining.isNegative ? "Exam over" : "$daysUntil days, $hoursUntil hours remaining";

    return Scaffold(
      appBar: AppBar(title: Text(examCard.exam.name, style: TextStyle(fontWeight: FontWeight.bold)),backgroundColor: bgColor, ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: bgColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset:  Offset(0, 4),
              )
            ],
          ),
          padding:  EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                children:[
                   Icon(Icons.calendar_today, color: Colors.black54),
                   SizedBox(width: 8),
                   Text(examCard.formattedDate()),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                children: [
                   Icon(Icons.meeting_room, color: Colors.black54),
                   SizedBox(width: 8),
                   Text("Classrooms: ${examCard.exam.classrooms.join(', ')}",
                     style:TextStyle(fontSize: 18),),
                  ],
                ),
                  SizedBox(height: 16),
                Row(
                  children: [
                  Icon(Icons.timelapse, color: Colors.black54),
                    SizedBox(width: 8),
                    Text(displayRemaining,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
          ),
        ),
      ),
    );
  }
}


