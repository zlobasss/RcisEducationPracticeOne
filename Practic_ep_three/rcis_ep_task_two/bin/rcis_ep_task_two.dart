import 'package:rcis_ep_task_two/rcis_ep_task_two.dart' as rcis_ep_task_two;

import 'dart:io';

void main() async {
  String numsInFile = "";
  String oddNums = "";
  bool isNumber = false;
  File file = File("");
  List<String> lines = [];
  
  try{
    file = File('nums.txt');
    lines = file.readAsLinesSync();
  } catch (e){
    print("Ошибка. Отсутсвует файл");
    file = await File('nums.txt').writeAsString("");
  }

  for (int k = 0; k < lines.length; ++k){
    lines[k] += " ";
    for(int i = 0; i < lines[k].length; ++i){
      if(lines[k][i] != " "){
        isNumber = true;
        numsInFile += lines[k][i];
        continue;
      }
      if(lines[k][i] == " " && isNumber == true){
        try{
          if(int.parse(numsInFile) % 2 != 0){
            oddNums += "$numsInFile ";
          }
        } catch (e) {
          print("\n\"Это не число\" => $numsInFile");
        }
        numsInFile = "";
        isNumber = false;
        continue;
      }
    }
  }
  
  if(oddNums.length > 1){
    oddNums = oddNums.substring(0, oddNums.length - 1);
  }

  file = await File('nums.txt').writeAsString(oddNums);
}
