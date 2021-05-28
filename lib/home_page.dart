import 'package:flutter/material.dart';
import 'package:mafia/dice_page.dart';
import 'package:persian/persian.dart';
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

  int _getCityCount() {
    final selection = _selection.entries
        .where((element) => element.value == true)
        .map((e) => e.key)
        .toList();

    final c = selection
        .where((element) =>
            element.startsWith('INNOCENT_') ||
            cityRoles.where((e) => e.tag == element).isNotEmpty)
        .length;

    return c;
  }

  int _getEvilCount() {
    final selection = _selection.entries
        .where((element) => element.value == true)
        .map((e) => e.key)
        .toList();

    final e = selection
        .where((element) =>
            element.startsWith('MAFIA_') ||
            evilRoles.where((e) => e.tag == element).isNotEmpty)
        .length;

    return e;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مافیا'),
          actions: [
            IconButton(
              onPressed: _getCityCount() < 3 || _getEvilCount() < 1
                  ? null
                  : () {
                      final items = _selection.entries
                          .where((element) => element.value == true)
                          .map((e) => e.key)
                          .toList();

                      items.shuffle();

                      final page = DicePage(data: items);

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => page));
                    },
              icon: const Icon(Icons.check),
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'شهر (${_getCityCount()})'.withPersianNumbers()),
              Tab(text: 'مافیا (${_getEvilCount()})'.withPersianNumbers()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildCityListView(),
            buildEvilListView(),
          ],
        ),
      ),
    );
  }

  ListView buildCityListView() {
    return ListView(
      children: [
        ...cityRoles.map(
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
            activeColor: Colors.green,
            onChanged: (value) {
              _set(e.tag, value);
            },
          ),
        ),
        ...List.generate(
          20,
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
      ],
    );
  }

  ListView buildEvilListView() {
    return ListView(
      children: [
        ...evilRoles.map(
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
          20,
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
    );
  }
}
