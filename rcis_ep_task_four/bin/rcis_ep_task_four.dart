import 'package:rcis_ep_task_four/rcis_ep_task_four.dart' as rcis_ep_task_four;
import 'dart:io';
import 'dart:math';

List<int> randMass(int min, int max, int N){
  List<int> mass = [];
  int rng = 0;
  for(int i = 0; i < N; ++i){
    rng = Random().nextInt(max - min + 1) + min;
    mass.add(rng);
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
      print("Ошибка.");
      continue;
    }
    stdout.write("Введите конец диапазона: ");
    try{
      max = int.parse(stdin.readLineSync()!);
    } catch (formatException){
      print("Ошибка.");
      continue;
    }
    repeat = 0;
  }

  List<int> mass = randMass(min, max, N);

  for(int i = 0; i < N; ++i){
    stdout.write("${mass[i]} ");
  }
}