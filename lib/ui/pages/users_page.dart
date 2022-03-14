import 'package:chat_app_/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
 
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override 
      
  Widget build(BuildContext context) {
    final users = [
      UserModel(true, 'osvan@osvan.com', 'Osva', '1'),
      UserModel(false, 'm@osvan.com', 'Migue', '2'),
      UserModel(true, 'l@osvan.com', 'Luci', '3'),
      UserModel(true, 'r@osvan.com', 'Regi', '4'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.logout,
        ),
        title: const Text(
          'Usuarios',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.where_to_vote,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        child: _listUsers(users),
        onRefresh: () => _refreshUsers(),
        header: const WaterDropHeader(
          
          complete: Icon(
            Icons.check,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }

  ListView _listUsers(List<UserModel> users) {
    return ListView.separated(
        itemBuilder: (_, i) => _tileUser(users, i),
        separatorBuilder: (_, i) => Divider(),
        itemCount: users.length);
  }

  ListTile _tileUser(List<UserModel> users, int i) {
    return ListTile(
      title: Text(users[i].nombre),
      trailing: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: users[i].online ? Colors.green : Colors.red,
        ),
      ),
      leading: CircleAvatar(
        child: Text(
          users[i].nombre.substring(0, 2),
        ),
      ),
    );
  }

  _refreshUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}
