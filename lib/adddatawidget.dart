import 'package:flutter/material.dart';
import 'models/person.dart';
import 'services/api_service.dart';

class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String access = 'FUNCIONARIO';
  AcessPerson _access = AcessPerson.FUNCIONARIO;
  final _nameController = TextEditingController();
  final _loginController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Usuário'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _loginController,
                                decoration: const InputDecoration(
                                  hintText: 'Login',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter age';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Nome',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor inserir o nome';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Sobrenome',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor inserir o sobrenome';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Senha',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor inserir a senha';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Acesso'),
                              ListTile(
                                title: const Text('Dentista'),
                                leading: Radio(
                                  value: AcessPerson.DENTISTA,
                                  groupValue: _access,
                                  onChanged: (AcessPerson? value) {
                                    setState(() {
                                      _access = value!;
                                      access = 'DENTISTA';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Funcionário'),
                                leading: Radio(
                                  value: AcessPerson.FUNCIONARIO,
                                  groupValue: _access,
                                  onChanged: (AcessPerson? value) {
                                    setState(() {
                                      _access = value!;
                                      access = 'FUNCIONARIO';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createPerson(Person(
                                        name: _nameController.text,
                                        login: _loginController.text,
                                        lastname: _lastNameController.text,
                                        acess: access,
                                        password: _passwordController.text,
                                        status: '',
                                        id: ''));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Cadastrar',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
