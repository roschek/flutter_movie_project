
import 'package:first_big_app/ui/widgets/services/custom_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreencastWidget extends StatelessWidget {
  const MovieDetailsScreencastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Some other title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
                height: 250,
                child: ListView.builder(
                    itemCount: 20,
                    itemExtent: 120,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                        children: [
                          Image(image: AssetImage(AppImages.cardImage)),
                            Text('Блок с информацией об актерах')
                        ],
                      ),);
                    })),
            TextButton(onPressed: () {}, child: Text('Full Cast & Crew')),
          ],
        ));
  }
}
