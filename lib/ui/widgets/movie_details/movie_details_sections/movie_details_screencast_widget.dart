import 'package:first_big_app/domains/api_client/api_client.dart';
import 'package:first_big_app/library/notify_provider.dart';
import 'package:first_big_app/ui/widgets/services/custom_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_details_model.dart';

class MovieDetailsScreencastWidget extends StatelessWidget {
  const MovieDetailsScreencastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);
    final companyList = model?.movieDetails?.productionCompanies;
    final casting = model?.movieDetails?.credits?.cast;
    if(casting == null || casting.isEmpty) return SizedBox.shrink();
    return ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Команда',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            companyList != null
                ? SizedBox(
                    height: 250,
                    child: ListView.builder(
                        itemCount: casting.length,
                        itemExtent: 120,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                casting[index].profilePath != null ?
                                Image.network(
                                    ApiClient.baseUrl(casting[index].profilePath!),
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain) : SizedBox.shrink(),
                                SizedBox(height: 10),
                                Text(casting[index].name)
                              ],
                            ),
                          );
                        }))
                : SizedBox.shrink(),
            TextButton(onPressed: () {}, child: Text('Full Cast & Crew')),
          ],
        ));
  }
}
