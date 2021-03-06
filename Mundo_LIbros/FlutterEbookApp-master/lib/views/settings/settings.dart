import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/theme/theme_config.dart';
import 'package:flutter_ebook_app/util/router.dart';
import 'package:flutter_ebook_app/view_models/app_provider.dart';
import 'package:flutter_ebook_app/views/downloads/downloads.dart';
import 'package:flutter_ebook_app/views/favorites/favorites.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List items;

  @override
  void initState() {
    super.initState();
    items = [
      {
        'icon': Feather.heart,
        'title': 'Favoritos',
        'function': () => _pushPage(Favorites()),
      },
      {
        'icon': Feather.download,
        'title': 'Descargas',
        'function': () => _pushPage(Downloads()),
      },
      {
        'icon': Feather.moon,
        'title': 'Modo Oscuro',
        'function': () => _pushPage(Downloads()),
      },
      {
        'icon': Feather.gift,
        'title': 'Mensaje Oculto',
        'function': () => showAbout(),
      },
      {
        'icon': Feather.check,
        'title': 'Licencias',
        'function': () => _pushPageDialog(LicensePage()),
      },
      {
        'icon': Feather.award,
        'title': 'Extras',
        'function': () => _pushPage(Favorites()),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Remove Dark Switch if Device has Dark mode enabled
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      items.removeWhere((item) => item['title'] == 'Modo Oscuro');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ajustes',
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if (items[index]['title'] == 'Modo Oscuro') {
            return _buildThemeSwitch(items[index]);
          }

          return ListTile(
            onTap: items[index]['function'],
            leading: Icon(
              items[index]['icon'],
            ),
            title: Text(
              items[index]['title'],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  Widget _buildThemeSwitch(Map item) {
    return SwitchListTile(
      secondary: Icon(
        item['icon'],
      ),
      title: Text(
        item['title'],
      ),
      value: Provider.of<AppProvider>(context).theme == ThemeConfig.lightTheme
          ? false
          : true,
      onChanged: (v) {
        if (v) {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.darkTheme, 'dark');
        } else {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.lightTheme, 'light');
        }
      },
    );
  }

  _pushPage(Widget page) {
    MyRouter.pushPage(context, page);
  }

  _pushPageDialog(Widget page) {
    MyRouter.pushPageDialog(context, page);
  }

  showAbout() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            'Sobre mi Aplicación',
          ),
          content: Text(
            'EL MUNDO DE LOS LIBROS ESTÁ EN TUS MANOS',
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Theme.of(context).accentColor,
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cerrar',
              ),
            ),
          ],
        );
      },
    );
  }
}
