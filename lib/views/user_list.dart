import 'package:flutter/material.dart';
import 'package:prog_IV/components/user_tile.dart';
import 'package:prog_IV/models/user.dart';
import 'package:prog_IV/provider/users_provider.dart';
import 'package:prog_IV/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              })
        ],
      ),
      body: StreamBuilder<List<User>>(
        stream: usersProvider.users,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return UserTile(
                User(
                  id: snapshot.data[index].id,
                  name: snapshot.data[index].name,
                  email: snapshot.data[index].email,
                  imgUrl: snapshot.data[index].imgUrl,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
