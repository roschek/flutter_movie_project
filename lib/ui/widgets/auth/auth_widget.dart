import 'package:first_big_app/library/notify_provider.dart';
import 'package:flutter/material.dart';

import 'auth_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Страница авторизации'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
          SizedBox(height: 25),
          _FormWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);
  final textStyle = const TextStyle(fontSize: 14, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
              'Для доступа к приложению введите логин и пароль или зарегистрируйтесь',
              style: textStyle),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF53b0df))),
              child: Text('Зарегистрироваться'))
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.read<AuthModel>(context);
    final textStyle = const TextStyle(fontSize: 14, color: Colors.black);

    final textFieldDecorator = const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(10),
        isCollapsed: true);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ErrorMessageWidget(),
          Text('Имя пользователя', style: textStyle),
          SizedBox(height: 10),
          TextField(
            controller: model?.loginTextController,
            decoration: textFieldDecorator,
          ),
          SizedBox(height: 25),
          Text('Пароль', style: textStyle),
          SizedBox(height: 10),
          TextField(
              controller: model?.passwordTextController,
              decoration: textFieldDecorator,
              obscureText: true),
          SizedBox(height: 25),
          Row(
            children: [
              _AuthButtonWidget(),
              SizedBox(width: 25),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          TextStyle(color: Color(0xFF53b0df)))),
                  child: Text('Сбросить пароль'))
            ],
          ),
        ],
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.canStartAuth == true
        ? const Text('Авторизоваться')
        : SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(),
          );
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF53b0df))),
        child: child);
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifyProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return SizedBox.shrink();
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(errorMessage, style: TextStyle(color: Colors.red)));
  }
}
