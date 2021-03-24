import 'package:flutter/material.dart';
import 'package:prog_IV/models/user.dart';
import 'package:prog_IV/provider/provider.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _fillForm (User user) {
    if (user != null){
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['imgUrl'] = user.imgUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    _fillForm(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _form.currentState.save();
              Provider.of<UsersProvider>(context, listen: false).put(
                User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  imgUrl: _formData['imgUrl'],
                ),
              );
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                initialValue: _formData['name'],
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                initialValue: _formData['email'],
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL da imagem",
                ),
                initialValue: _formData['imgUrl'],
                onSaved: (value) => _formData['imgUrl'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
