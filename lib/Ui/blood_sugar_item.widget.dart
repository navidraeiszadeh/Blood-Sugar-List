import 'package:flutter/material.dart';

import 'package:untitled/data/blood_sugar.model.dart';


class BloodSugarItem extends StatelessWidget {
  final Blood bloodSugarItem;

  const BloodSugarItem({Key? key, required this.bloodSugarItem})
      : super(key: key);

  String? get bloodSugar => "${bloodSugarItem.bloodSugar}  mg/dl";

  String? get dateTime =>
      "${bloodSugarItem.measureTime.year.toString()}/${bloodSugarItem.measureTime.month.toString()}/${bloodSugarItem.measureTime.day.toString()}\n${bloodSugarItem.measureTime.hour.toString()}:${bloodSugarItem.measureTime.minute.toString()}";

  get bloodStatue => bloodSugarItem.measureState.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 5),
      //Border:  BorderRadius.all(Radius.circular(15)),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(216, 239, 237, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      bloodSugar!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.circle_rounded,
                        color: Colors.green, size: 20),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      dateTime!,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      bloodStatue!,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
