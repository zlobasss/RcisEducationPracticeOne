import 'dart:math';

import 'package:rcis_ep_task_three/rcis_ep_task_three.dart' as rcis_ep_task_three;
import 'dart:io';

void main(){
  const int M = 10;
  const int N = 10;
  List<List<int>> mass = List.generate(M, (_) => List.filled(N, 1));

  for(int i = 1; i < M; ++i){
    for(int j = 1; j < N; ++j){
      mass[i][j] = mass[i-1][j] + mass[i][j-1];
    }
  }

  for(int i = 0; i < M; ++i){
    for(int j = 0; j < N; ++j){
      stdout.write("${mass[i][j]}\t");
    }
    stdout.write("\n");
  }
}

// int matrix(int i, int j){                                                        // Это шуточный код, можете раскомментировать его и испытать
//   if(i == 0 || j == 0){                                                          // Его принцип в том, что он каждый раз прибавляет по единицам
//     return 1;                                                                    // Т.е чтобы узнать число в матрице под индексами [19][14] - 818.809.200
//   } else {                                                                       // Коду предстоит сделать более 10 млрд вычислений
//     return matrix(i - 1, j) + matrix(i, j - 1);                                  // а может и намного больше, я после 10 млрд не считал :P
//   }
// }

// void main() {
//   const int M = 20;
//   const int N = 15;
//   List<List<int>> mass = List.generate(M, (int i) => List.generate(N, (int j) => matrix(i, j)));

//   for(int i = 0; i < M; ++i) {
//     for(int j = 0; j < N; ++j) {
//       stdout.write("${mass[i][j]}\t");
//     }
//     stdout.write("\n");
//   }
// }