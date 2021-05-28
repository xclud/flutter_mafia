import 'package:flutter/material.dart';
import 'package:persian/persian.dart';
import 'package:mafia/mafia_roles.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key, required this.data}) : super(key: key);

  final List<String> data;

  @override
  State<StatefulWidget> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  bool _hideRoles = false;
  final _selected = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انتخاب نقش ها'),
        actions: [
          IconButton(
            onPressed:
                _selected.isNotEmpty && _selected.length != widget.data.length
                    ? null
                    : () {
                        setState(() {
                          _hideRoles = !_hideRoles;
                        });
                      },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          final tag = widget.data[index];
          final e = _getRole(tag);

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: _isSelected(tag) || _hideRoles == false
                  ? null
                  : () {
                      setState(() {
                        _selected.add(tag);
                        _hideRoles = true;
                      });

                      bool canPop = false;

                      showDialog(
                          context: context,
                          builder: (context) {
                            return WillPopScope(
                              onWillPop: () => Future.value(canPop),
                              child: AlertDialog(
                                title: Text(e.name),
                                content: Text(e.description),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      canPop = true;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('فهمیدم'),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
              child: Text(_getPlayerName(e, index)),
            ),
          );
        },
      ),
    );
  }

  MafiaRole _getRole(String tag) {
    if (tag.startsWith('INNOCENT_')) {
      return MafiaRole('شهروند ساده', 'شهروند ساده', tag);
    }

    if (tag.startsWith('MAFIA_')) {
      return MafiaRole('مافیا ساده', 'مافیا ساده', tag);
    }

    return mafiaRoles.firstWhere((element) => element.tag == tag);
  }

  bool _isSelected(String tag) {
    return _selected.contains(tag);
  }

  String _getPlayerName(MafiaRole role, int index) {
    final position = _selected.indexOf(role.tag);

    if (!_hideRoles &&
        (_selected.isEmpty || _selected.length == widget.data.length)) {
      if (position == -1) {
        return role.name;
      }
      return '${role.name} - ترتیب ${position + 1}'.withPersianNumbers();
    }

    if (position == -1) {
      return 'بازیکن ${index + 1}'.withPersianNumbers();
    }
    return 'بازیکن ${index + 1} - ترتیب ${position + 1}'.withPersianNumbers();
  }
}
