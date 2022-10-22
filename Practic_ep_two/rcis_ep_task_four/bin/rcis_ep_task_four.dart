import 'dart:io';
import 'dart:math';

import 'package:rcis_ep_task_four/rcis_ep_task_four.dart' as rcis_ep_task_four;

List<double> averTemper(List<List<int>> mass){
  List<double> averMass = [];
  int aver = 0;
  for(int i = 0; i < 12; ++i){
    aver = 0;
    for(int j = 0; j < 30; ++j){
      aver += mass[i][j];
    }
    aver = aver * 100 ~/ 30;
    averMass.add(aver / 100);
  }
  
  return averMass;
}

void main() {

  List<List<int>> temperature = List.generate(12, (_) => List.generate(30, (_) => Random().nextInt(36) - 10));

  stdout.write("Средняя температура каждого месяца: ${averTemper(temperature)}\n");
  stdout.write("Отсортированная средняя температура каждого месяца: ${averTemper(temperature)..sort()}");
}
