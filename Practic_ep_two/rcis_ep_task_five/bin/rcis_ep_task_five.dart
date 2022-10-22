import 'dart:io';
import 'dart:math';

import 'package:rcis_ep_task_five/rcis_ep_task_five.dart' as rcis_ep_task_five;

List<double> averTemper(Map<String, List<int>> mass){

  List<double> averMass = [];
  int aver = 0;
  for(var month in mass.keys){
    aver = 0;
    for(int j = 0; j < 30; ++j){
      aver += mass[month]![j];
    }
    aver = aver * 100 ~/ 30;
    averMass.add(aver / 100);
  }

  return averMass;
}

void main() {

  Map<String, List<int>> temperature = {
    "Январь": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Февраль": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Март": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Апрель": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Май": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Июнь": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Июль": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Август": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Сентябрь": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Октябрь": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Ноябрь": List.generate(30, (_) => Random().nextInt(36) - 10),
    "Декабрь": List.generate(30, (_) => Random().nextInt(36) - 10),
  };

  // List<List<int>> temperature = List.generate(12, (_) => List.generate(30, (_) => Random().nextInt(36) - 10));

  stdout.write("Средняя температура каждого месяца: ${averTemper(temperature)}\n");
  stdout.write("Отсортированная средняя температура каждого месяца: ${averTemper(temperature)..sort()}");
}
