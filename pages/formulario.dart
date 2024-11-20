import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/database_helper.dart';
import 'package:flutter_application_1/database/user_dao.dart';
import 'package:flutter_application_1/models/user_model.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String procesador = '';
  String discoduro = '';
  String ram = '';
  List<UserModel> users = [];
  final dao = UserDao(); // DAO to handle SQLite operations

  @override
  void initState() {
    super.initState();
    _fetchUsers(); // Fetch users on init
  }

  Future<void> _fetchUsers() async {
    final allUsers = await dao.readAll();
    setState(() {
      users = allUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 16),
// En el formulario, agregar un campo para ingresar el ID
              TextFormField(
                decoration: const InputDecoration(labelText: 'ID'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un ID';
                  }
                  return null;
                },
                onChanged: (value) {
                  id = value; // Guardamos el ID ingresado
                },
              ),
              // Password field
              TextFormField(
                decoration: const InputDecoration(labelText: 'Procesador'),
                //obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un Procesador';
                  }
                  return null;
                },
                onChanged: (value) {
                  procesador = value;
                },
              ),
              const SizedBox(height: 16),

              // Email field
              TextFormField(
                decoration: const InputDecoration(labelText: 'Disco Duro'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un Disco Duro';
                  }
                  return null;
                },
                onChanged: (value) {
                  discoduro = value;
                },
              ),
              const SizedBox(height: 16),

              // Celular field
              TextFormField(
                decoration: const InputDecoration(labelText: 'RAM'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una RAM';
                  }
                  return null;
                },
                onChanged: (value) {
                  ram = value;
                },
              ),
              const SizedBox(height: 24),

              // Button to save the data
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = UserModel(
                      id: int.tryParse(id) ??
                          0, // Convierte el ID a entero, si no es válido, usa 0
                      procesador: procesador,
                      discoduro: discoduro,
                      ram: ram,
                    );
                    await dao
                        .insert(user); // Guarda el usuario en la base de datos
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro exitoso')),
                    );
                    _fetchUsers(); // Refresca la lista después de guardar
                  }
                },
                child: const Text('Registrarse'),
              ),

              const SizedBox(height: 24),

              // Display list of users
              const Text(
                'Usuarios Registrados:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  // Controllers for the text fields to edit user data
                  final TextEditingController editPasswordController =
                      TextEditingController(text: user.procesador);
                  final TextEditingController editEmailController =
                      TextEditingController(text: user.discoduro);
                  final TextEditingController editCelularController =
                      TextEditingController(text: user.ram);

                  return ListTile(
                    title: Text(user.procesador),
                    subtitle: Text(user.discoduro),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit button
                        IconButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Actualizar Computadora'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: editPasswordController,
                                        decoration: const InputDecoration(
                                          labelText: 'Nueva Procesador',
                                        ),
                                        //obscureText: true,
                                      ),
                                      TextField(
                                        controller: editEmailController,
                                        decoration: const InputDecoration(
                                          labelText: 'Nuevo Disco Duro',
                                        ),
                                      ),
                                      TextField(
                                        controller: editCelularController,
                                        decoration: const InputDecoration(
                                          labelText: 'Nuevo RAM',
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        final updatedUser = user.copyWith(
                                          procesador:
                                              editPasswordController.text,
                                          discoduro: editEmailController.text,
                                          ram: editCelularController.text,
                                        );
                                        await dao.update(updatedUser);
                                        setState(() {
                                          users[index] = updatedUser;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Actualizar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        // Delete button
                        IconButton(
                          onPressed: () async {
                            await dao.delete(user);
                            setState(() {
                              users.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
