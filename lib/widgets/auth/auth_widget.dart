//import 'package:first_big_app/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget{
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
       FooterWidget(),
      ],
     ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
 const _HeaderWidget({Key? key}) : super(key: key);
 final textStyle = const TextStyle(
     fontSize: 14,
     color: Colors.black);
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
             style: textStyle ),
         SizedBox(height: 20),
         ElevatedButton(
             onPressed: (){},
             style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF53b0df))),
             child: Text('Зарегистрироваться'))
     ],
     ),
    );
  }
}

class _FormWidget extends StatefulWidget {
 const _FormWidget({Key? key}) : super(key: key);
 @override
 __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = nul;

  static String? get nul => null;
  _auth() {
  final login = _loginTextController.text;
  final password = _passwordTextController.text;
  if(login == 'admin' && password == 'admin') {
   errorText = null;
   final navigator = Navigator.of(context);
   navigator.pushReplacementNamed('/main');

   print('open app');
  } else {
    errorText = 'Неверный логин или пароль';
  }
  setState(() {
  });
 }

  _resetPassword(){
  print('пароль сброшен');
 }

 @override
 Widget build(BuildContext context) {
  final textStyle = const TextStyle(
   fontSize: 14,
   color: Colors.black);

  final textFieldDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(10),
      isCollapsed: true
  );

    return Padding(
      padding: EdgeInsets.all(20),
      child:Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        if(errorText != null) Text(errorText!, style: TextStyle(color: Colors.red)),
        SizedBox(height: 10),
        Text('Имя пользователя', style: textStyle),
        SizedBox(height: 10),
        TextField(
         controller: _loginTextController,
         decoration: textFieldDecorator,),
        SizedBox(height: 25),
        Text('Пароль', style: textStyle),
        SizedBox(height: 10),
        TextField(
            controller: _passwordTextController,
            decoration: textFieldDecorator,
            obscureText: true),
        SizedBox(height: 25),
         Row(
         children: [
          ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF53b0df))),
              child: Text('Авторизоваться')),
          SizedBox(width: 25),
          TextButton(
              onPressed: _resetPassword,
              style: ButtonStyle(textStyle: MaterialStateProperty.all(TextStyle(color: Color(0xFF53b0df)))),
              child:Text('Сбросить пароль'))

         ],
        ),
     ],
    ),
    );
  }
}

class FooterWidget extends StatelessWidget {
 const FooterWidget({Key? key}) : super(key : key);
 final footerTextStyle = const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold );
 @override
 Widget build(BuildContext context) {
    return Container(
     color: Color.fromRGBO(3, 37, 65, 1),
         child: Padding(
          padding: EdgeInsets.all(30),
          child:Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Text('data',style: footerTextStyle),
            SizedBox(height:10),
            Text('data',style: footerTextStyle),
            SizedBox(height:10),
            Text('data',style: footerTextStyle),
            SizedBox(height:10),
            Text('data',style: footerTextStyle),
            SizedBox(height:10),
            Text('data',style: footerTextStyle),
            SizedBox(height:10),
            Text('data',style: footerTextStyle),
           ],
         ),
         ),
    );
  }
}