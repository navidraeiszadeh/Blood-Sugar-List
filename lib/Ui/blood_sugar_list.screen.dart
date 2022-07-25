import 'package:flutter/material.dart';
import 'package:untitled/Ui/smart_refresher.body.dart';
import 'package:untitled/data/blood_sugar.model.dart';
import 'package:untitled/bloc/blood_sugar.bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'blood_sugar_item.widget.dart';

class BloodSugar extends StatefulWidget {
  const BloodSugar({Key? key}) : super(key: key);

  @override
  State<BloodSugar> createState() => BloodSugarPage();
}

class BloodSugarPage extends State<BloodSugar> {
  int currentPage = 1;
  int totalPages = 10;
  String token =
      "665d6ee12ce39d79cd7d0f203b30f44eb4dd17d07a7638f29fd2241cda3e536e";
  String previous =
      "https://devapi.staging.mamania.me/patients/me/health-data/blood-sugar/v1/?limit=10";
  String URL =
      "https://devapi.staging.mamania.me/patients/me/health-data/blood-sugar/v1/?limit=10";

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  final BloodSugarBloc _bloc = BloodSugarBloc();

  Future<bool> getBloodData({bool isRefresh = false}) async {
    if (isRefresh) {
      setState(() {
        listElement(context, 1);
      });
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
      setState(() {
        listElement(context, 0);
      });
    }
    return true;
  }

  Widget listElement(BuildContext context, int i) {
    if (i == 1) {
      URL = previous;
    }
    return FutureBuilder<List<Blood>>(
      future: _bloc.getData(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapShot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return BloodSugarItem(bloodSugarItem: snapShot.data![index]);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        automaticallyImplyLeading: false,
        title: const SizedBox(
          width: double.infinity,
          height: 40,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "قند خون",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          // Go to Search Page
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.navigate_next_rounded,
                color: Colors.black, size: 30),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getBloodData(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getBloodData();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: const RefreshPage(),
      ),
    );
  }
  void loadMore() {
    setState(() {
      listElement(context, 0);
    });
  }
}
