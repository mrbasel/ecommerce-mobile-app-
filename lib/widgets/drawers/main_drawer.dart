import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      'Account',
                    ),
                    decoration: BoxDecoration(color: Colors.grey[100]),
                  ),
                  ListTile(
                    title: Text('Clothes'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onPressed: null),
                  ),
                  Divider(
                    height: 8,
                  ),
                  ListTile(
                    title: Text('Electronies'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onPressed: null),
                  ),
                  Divider(
                    height: 8,
                  ),
                  ListTile(
                    title: Text('Groceies'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onPressed: null),
                  ),
                  Divider(
                    height: 8,
                  ),
                  ListTile(
                    title: Text('Fitness & Gym'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onPressed: null),
                  ),
                  Divider(
                    height: 8,
                  ),
                  ListTile(
                    title: Text('Books'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onPressed: null),
                  ),
                  Divider(
                    height: 8,
                  )
                ],
              ),
            );
  }
}