import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../data/blood_sugar.model.dart';
import '../data/blood_sugar_list.model.dart';
import 'package:untitled/data/blood_sugar.dao.dart';

import '../data/database.dart';


class BloodSugarBloc extends BlocObserver {

  final BloodSugarDao _bloodSugarDao = BloodSugarDao(AppDb());

  Future<List<Blood>> getData() async {
    List<Blood> apiData = [];
    try {
      apiData = await getAllData();
    } catch(e) {
      if (kDebugMode) {
        print("couldn't Read from api........ ");
      }
    }
    if (apiData.isNotEmpty){
      for (Blood element in apiData) {_bloodSugarDao.insertBloodSugar(element);}
      return apiData;
    }
    return await _bloodSugarDao.watchBloodSugars();
  }

}