import 'package:flutter/material.dart';
import 'package:mafia/mafia_roles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _selection = <String, bool>{};

  bool _selected(String tag) {
    tag = tag.toUpperCase();

    return _selection.containsKey(tag) && _selection[tag] == true;
  }

  void _set(String tag, bool value) {
    tag = tag.toUpperCase();

    setState(() {
      _selection[tag] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مافیا'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('بازیکن ها'),
            onTap: () {
              final items = _selection.entries
                  .where((element) => element.value == true)
                  .toList();

              items.shuffle();

              print(items.map((e) => e.key).join(', '));
            },
          ),
          Expanded(
            child: ListView(
              children: [
                ...mafiaRoles.map(
                  (e) => SwitchListTile(
                    dense: true,
                    title: Text(
                      e.name,
                      style: TextStyle(
                        color: e.evil ? Colors.red : Colors.green,
                      ),
                    ),
                    subtitle: Text(e.description),
                    value: _selected(e.tag),
                    activeColor: e.evil ? Colors.red : Colors.green,
                    onChanged: (value) {
                      _set(e.tag, value);
                    },
                  ),
                ),
                ...List.generate(
                  10,
                  (index) => SwitchListTile(
                    dense: true,
                    title: const Text(
                      'شهروند ساده',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    subtitle: const Text('شهروند ساده'),
                    value: _selected('INNOCENT_$index'),
                    activeColor: Colors.green,
                    onChanged: (value) {
                      _set('INNOCENT_$index', value);
                    },
                  ),
                ),
                ...List.generate(
                  10,
                  (index) => SwitchListTile(
                    dense: true,
                    title: const Text(
                      'مافیا ساده',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    subtitle: const Text('مافیا ساده'),
                    value: _selected('MAFIA_$index'),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      _set('MAFIA_$index', value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
