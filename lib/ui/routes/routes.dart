import 'package:chat_app_/ui/pages/chat_page.dart';
import 'package:chat_app_/ui/pages/loading_page.dart';
import 'package:chat_app_/ui/pages/login_page.dart';
import 'package:chat_app_/ui/pages/register_page.dart';
import 'package:chat_app_/ui/pages/users_page.dart';

final routes = {
'chat_page': (_) => ChatPage(),
'loading_page': (_) => LoadingPage(),
'login_page': (_) => LoginPage(),
'register_page': (_) => RegisterPage(),
'users_page': (_) => UsersPage(),
};