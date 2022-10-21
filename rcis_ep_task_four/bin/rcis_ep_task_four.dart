import 'package:rcis_ep_task_four/rcis_ep_task_four.dart' as rcis_ep_task_four;
import 'dart:io';
import 'dart:math';

List<int> randMass(int min, int max, int N){
  List<int> mass = [];
  for(int i = 0; i < N; ++i){
    mass.add(Random().nextInt(max - min + 1) + min);
  }

  return mass;
}

void main(){
  const int N = 10;
  int min = 0;
  int max = 0;

  int repeat = -1;
  while(repeat != 0){
    stdout.write("Введите начало диапазона: ");
    try {
      min = int.parse(stdin.readLineSync()!);
    } catch (formatException){
      print("Ошибка. Введено не число...");
      continue;
    }
    stdout.write("Введите конец диапазона: ");
    try{
      max = int.parse(stdin.readLineSync()!);
    } catch (formatException){
      print("Ошибка. Введено не число...");
      continue;
    }
    repeat = 0;
  }

  int c = max;
  if(max < min){
    max = min;
    min = c; 
    print("\nКонец и начало перепутаны меняем...\n");
  }

  List<int> mass = randMass(min, max, N);

  for(int i = 0; i < N; ++i){
    stdout.write("${mass[i]} ");
  }
}