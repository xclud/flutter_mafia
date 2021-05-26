import 'package:flutter/material.dart';
import 'package:persian/persian.dart';
import 'package:mafia/mafia_roles.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key, required this.data}) : super(key: key);

  final List<MapEntry<String, bool>> data;

  @override
  State<StatefulWidget> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انتخاب نقش ها'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: mafiaRoles.length,
        itemBuilder: (context, index) {
          final e = mafiaRoles[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(e.name),
                        content: Text(e.description),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('فهمیدم'),
                          ),
                        ],
                      );
                    });
              },
              child: Text(
                'بازیکن ${index + 1}'.withPersianNumbers(),
              ),
            ),
          );
        },
      ),
    );
  }
}
