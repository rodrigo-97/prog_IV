import 'package:flutter/material.dart';
import 'package:prog_IV/models/user.dart';
import 'package:prog_IV/provider/provider.dart';
import 'package:prog_IV/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.imgUrl == null || user.imgUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(backgroundImage: NetworkImage(user.imgUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Você realmente deseja remover este cadastro?"),
                  ),
                );
                Provider.of<UsersProvider>(context, listen: false).remove(user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
