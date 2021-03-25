import 'package:flutter/material.dart';
import 'package:prog_IV/models/user.dart';
import 'package:prog_IV/provider/users_provider.dart';
import 'package:prog_IV/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.imgUrl == null || !Uri.parse(user.imgUrl).isAbsolute
        ? CircleAvatar(
            child: Icon(Icons.person, color: Colors.white,),
            backgroundColor: Colors.grey,
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.imgUrl),
          );

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
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Provider.of<UsersProvider>(context, listen: false)
                              .removeUser(user.id);
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Sim"),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("Não"),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
