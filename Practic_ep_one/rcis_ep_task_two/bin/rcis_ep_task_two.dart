import 'package:rcis_ep_task_two/rcis_ep_task_two.dart' as rcis_ep_task_two;
import 'dart:io';

void main() {
  List<int> mass = [];
  
  int write = -1;
  int sum = 0;
  int prod = 1;

  while (write != 0){
    try{
      stdout.write("Введите число, если хотите завершить программу введите '0': ");
      write = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Ошибка. Введено не число...");
      continue;
    }

    if(write != 0){
      mass.add(write);
      sum += write;
      prod *= write;
    }
  }
  int aver = 0;
  try{
    aver = sum ~/ mass.length;
  } catch (e) {
    print("Ошибка. Массив пустой");
  }
  print("Массив: $mass");
  print("Сумма элементов: $sum");
  print("Произведение элементов: ${mass.length != 0 ? prod : 0}");
  print("Среднее арифметическое элементов: $aver"); 
}
