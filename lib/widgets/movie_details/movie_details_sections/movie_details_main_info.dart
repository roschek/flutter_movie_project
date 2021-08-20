import 'package:first_big_app/widgets/services/custom_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        _TitleWidget(),
        ButtonsWidget(),
        Padding(padding: EdgeInsets.only(top:20, left:50, right: 50, bottom:30),
            child:_SummaryWidget()),
        Text('Overview', style: TextStyle(color: Colors.white) ),
        Text('Lorem fvgdfe bvb dfsgtght gbhgh rtfhjuk nkuyk tyrty dgh tkluiltl gk,.oi;p'
            'sdgfhthjty kjyukyuk luil', style: TextStyle(color: Colors.white)),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Stefano Solimo',style: TextStyle(color: Colors.white)),
                Text('Director',style: TextStyle(color: Colors.white))
              ],),
            Column(
              children: [
                Text('Stefano Solimo',style: TextStyle(color: Colors.white)),
                Text('Director',style: TextStyle(color: Colors.white))
              ],
            )
            ]
            ),
        SizedBox(height: 20),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Stefano Solimo',style: TextStyle(color: Colors.white)),
                  Text('Director',style: TextStyle(color: Colors.white))
                ],),
              Column(
                children: [
                  Text('Stefano Solimo',style: TextStyle(color: Colors.white)),
                  Text('Director',style: TextStyle(color: Colors.white))
                ],
              )
            ]
        )
        ]
        );
       }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(AppImages.cardImage),
          fit: BoxFit.cover,
          width: 600,
          height: 300,),
          Positioned(
            top:10,
            left:10,
            bottom: 10,
            child:Image(
            image: AssetImage(AppImages.cardImage),
            fit: BoxFit.contain,
            width: 200,
            height: 250,))
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
        child:RichText(
      maxLines: 3,
        text: TextSpan(
        children: [
          TextSpan(
            text: 'Dune its all what we wait ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20)
          ),
          TextSpan(
            text:'2021', style: TextStyle(color: Colors.grey)
          )
        ]
      )
    )
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('ASGRAEGrowth 112/334/4 htyujryuj, gfdghrth, 34566, tghrthyrtj',
        maxLines: 3,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white));
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: (){},
            child: Text('raiting 99%',style: TextStyle(color: Colors.white))),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey
        ),
        TextButton(onPressed: (){},
            child: Row(
              children:[
                Icon(Icons.play_arrow),
                Text('Посмотреть трейлер',style: TextStyle(color: Colors.white))
              ]
            ))

      ],
    );
  }
}

