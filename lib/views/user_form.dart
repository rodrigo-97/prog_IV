import 'package:flutter/material.dart';
import 'package:prog_IV/models/user.dart';
import 'package:prog_IV/provider/users_provider.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _fillForm(User user) {
    if (user != null) {
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
                  hintText: "Nome",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                initialValue: _formData['name'],
                onSaved: (value) => _formData['name'] = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O campo nome é obrigatório!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  hintText: "E-mail",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                initialValue: _formData['email'],
                onSaved: (value) => _formData['email'] = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O campo e-mail é obrigatório!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL da imagem",
                  hintText: "URL da imagem",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.link),
                ),
                initialValue: _formData['imgUrl'],
                onSaved: (value) => _formData['imgUrl'] = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O URL da imagem nome é obrigatório!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ButtonTheme(
                minWidth: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    if (_form.currentState.validate()) {
                      _form.currentState.save();
                      Provider.of<UsersProvider>(context, listen: false).saveUser(
                        User(
                          id: _formData['id'],
                          name: _formData['name'],
                          email: _formData['email'],
                          imgUrl: _formData['imgUrl'],
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_add_outlined),
                      Text('Salvar'),
                    ],
                  ),
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
