import 'package:flutter/material.dart';
import 'package:prog_IV/components/user_tile.dart';
import 'package:prog_IV/provider/provider.dart';
import 'package:prog_IV/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final UsersProvider users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        actions: [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            }
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i))
      ),
    );
  }
}