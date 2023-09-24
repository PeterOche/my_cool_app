import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

// import 'tabs_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Map<String, bool> currentFilter;
  final Function saveFilters;

  SettingsScreen(this.currentFilter, this.saveFilters);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegeterian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    _vegan = widget.currentFilter['vegan']!;
    _vegeterian = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    bool currenValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currenValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegeterian,
                  'vegan': _vegan,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adgust your meal selection here!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-Free',
                  'Only show gluten-free meals',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Show only lactose-free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Show only vegetarian meals here',
                  _vegeterian,
                  (newValue) {
                    setState(
                      () {
                        _vegeterian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Show only vegan meals',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
