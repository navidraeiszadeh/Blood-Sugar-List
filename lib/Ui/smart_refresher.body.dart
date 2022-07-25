import 'package:flutter/material.dart';
import 'package:untitled/data/blood_sugar.model.dart';
import '../data/blood_sugar_list.model.dart';
import 'blood_sugar_item.widget.dart';
import 'blood_sugar_list.screen.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             nextPageSign(context),
             previousPageSign(context),
           ],
          ),
          listShow(context),
        ],
      ),
    );
  }

  Widget listShow (BuildContext context) {
    return FutureBuilder<List<Blood>>(
      future: getAllData(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapShot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return BloodSugarItem(
                  bloodSugarItem: snapShot.data![index]);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ) ;
  }

  Widget nextPageSign(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: IconButton(
        alignment: Alignment.center,
        icon: const Icon(Icons.navigate_before_rounded, size: 25),
        color: URL ==
                "https://devapi.staging.mamania.me/patients/me/health-data/blood-sugar/v1/?limit=10"
            ? Colors.grey
            : Colors.green,
        onPressed: () {
          //ToDo => setState
          BloodSugarPage().listElement(context, 1);
        },
      ),
    );
  }

  Widget previousPageSign (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: IconButton(
        alignment: Alignment.center,
        icon: const Icon(Icons.navigate_next_rounded, size: 25),
        color: BloodSugarPage().URL == "" ? Colors.grey : Colors.green,
        onPressed: () {
          //ToDo => SetState
          BloodSugarPage().listElement(context, 0);
        },
      ),
    );
  }
}
