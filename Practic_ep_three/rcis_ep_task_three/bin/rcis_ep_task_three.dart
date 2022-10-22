import 'package:rcis_ep_task_three/rcis_ep_task_three.dart' as rcis_ep_task_three;

import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main() async {
  String numsInFile = "";
  bool isNumber = false;
  List<int> height = [];
  File file = File("");
  List<String> lines = [];

  try{
    file = File('input.txt');
    lines = file.readAsLinesSync();
  } catch (e){
    print("Ошибка. Отсутсвует файл");
    file = await File('input.txt').writeAsString("");
  }


  for (int k = 0; k < lines.length; ++k){
    lines[k] += " ";
    for(int i = 0; i < lines[k].length; ++i){
      if(lines[k][i] != " " && lines[k][i] != ","){
        isNumber = true;
        numsInFile += lines[k][i];
        continue;
      }
      if((lines[k][i] == " " || lines[k][i] == ",") && isNumber == true){
        try{
          height.add(int.parse(numsInFile));
        } catch (e) {
          print("\nЭто не число => $numsInFile \n");
        }
        numsInFile = "";
        isNumber = false;
        continue;
      }
    }
  }
  print("height = $height");

  int maxVolume = 0;

  for(int i = 0; i < height.length; ++i){
    for(int j = i+1; j < height.length; ++j){
      if(height[i] > height[j]){
        maxVolume = height[j] * (j-i) > maxVolume ? height[j] * (j-i) : maxVolume;
      } else {
        maxVolume = height[i] * (j-i) > maxVolume ? height[i] * (j-i) : maxVolume;
      }
    }
  }

  print(maxVolume);
}
