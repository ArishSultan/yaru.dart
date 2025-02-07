import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yaru/yaru.dart' as yaru;

class ColorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        Text('Yaru Colors', style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 15.0),
        Row(
          children: [
            Expanded(child: colorPaletteExample('orange', yaru.Colors.orange)),
            SizedBox(width: 25.0),
            Expanded(
                child: colorPaletteExample(
                    'lightAubergine', yaru.Colors.lightAubergine)),
            SizedBox(width: 25.0),
            Expanded(
                child: colorPaletteExample(
                    'midAubergine', yaru.Colors.midAubergine)),
          ],
        ),
        Divider(height: 50.0, color: Colors.black),
        Row(
          children: [
            Expanded(
                child: colorPaletteExample(
                    'canonicalAubergine', yaru.Colors.canonicalAubergine)),
            SizedBox(width: 25.0),
            Expanded(
                child: colorPaletteExample(
                    'darkAubergine', yaru.Colors.darkAubergine)),
            SizedBox(width: 25.0),
            Expanded(
                child: colorPaletteExample('warmGrey', yaru.Colors.warmGrey)),
          ],
        ),
      ],
    );
  }

  Widget colorPaletteExample(String colorName, MaterialColor color) {
    Map<String, MaterialColor> _color = {colorName: color};
    int _shade = 0;
    TextStyle _textStyle(int _shade) => TextStyle(
          color: (_color.values.first[_shade]!.computeLuminance() > 0.4)
              ? Colors.black
              : Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        );
    List<Widget> _colorItem = [];
    for (int i = 0; i < 5; i++) {
      _shade += 100;
      _colorItem.add(Container(
        height: 45.0,
        color: _color.values.first[_shade],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 12,
                child: Text(
                  _color.keys.first + '[$_shade]',
                  style: _textStyle(_shade),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  '#' +
                      _color.values.first[_shade]!.value
                          .toRadixString(16)
                          .substring(2)
                          .toUpperCase(),
                  style: _textStyle(_shade),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return Column(
      children: _colorItem,
    );
  }
}
