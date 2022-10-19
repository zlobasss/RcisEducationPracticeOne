import 'package:rcis_ep_task_three/rcis_ep_task_three.dart' as rcis_ep_task_three;
import 'dart:io';

void main(List<String> arguments) {
  List<String> mass = [];

  String write = "0";

  while (write != ""){
    stdout.write("Введите элемент массива, для завершения введите '': ");
    write = stdin.readLineSync()!;
    if(write != ""){
      mass.add(write);
    }
  }
  
  int max = 0;
  int min = 0;
  
  for(int i = 1; i < mass.length; ++i){
    if(mass[i].length < mass[min].length){
      min = i;
    }
    if(mass[i].length > mass[max].length){
      max = i;
    }
  }

  print("Массив: $mass");
  print("Элемент с минимальной длиной: ${mass[min]}");
  print("Элемент с максимальной длиной: ${mass[max]}");
}
