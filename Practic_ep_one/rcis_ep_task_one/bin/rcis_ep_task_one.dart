import 'package:rcis_ep_task_one/rcis_ep_task_one.dart' as rcis_ep_task_one;
import 'dart:math';

void main() {
  List<int> mass = List.generate(10, (_) => Random().nextInt(10));
  
  int min = 0;

  for(int i = 1; i < 10; ++i){
    if(mass[i] < mass[min]){
      min = i;
    }
  }

  print(mass);
  print(min);
}
