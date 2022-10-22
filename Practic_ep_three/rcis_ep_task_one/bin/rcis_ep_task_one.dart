import 'package:rcis_ep_task_one/rcis_ep_task_one.dart' as rcis_ep_task_one;

import 'dart:io';

void main () async {
  File file = File('');
  List<String> lines = [];
  try {
    file = File("input.txt");
    lines = file.readAsLinesSync();
  } catch (e){
    print("Ошибка. Отсутствует файл 'input.txt'");
  }

  String workInput = "";
  String workInput2 = "";

  bool isNumber = false;
  String nums = "";
  List<int> lots = [];
  int numTicket = 1;

  String resultTicket = "";
  int countWinLot = 0;

  List<int> winLot = [];
  int n = 0;
  Map<int, List<int>> tickets = {};
  
  int countLines = 0;

  try {
    for (int k = 0; k < lines.length; ++k) {
      if(k == 0){
        lines[k] += " ";
        for(int i = 0; i < lines[k].length; ++i){
          if(lines[k][i] != " "){
            nums += lines[k][i];
          } else {
            try {
              winLot.add(int.parse(nums));
              workInput += "$nums ";
            } catch (e) {
              stdout.write("Ошибка. Выйграшный лот \"$nums\" не является числом...\n");
            }
            nums = "";
            continue;
          }
        }
      }

      if(k == 1){
        try{
          n = int.parse(lines[k]);
        } catch (e){
          stdout.write("Ошибка. Количество билетов не является числом...\n");
        }
      }

      if(k >= 2){
        lines[k] += " ";
        lots = [];
        for(int j = 0; j < lines[k].length; ++j){
          if(lines[k][j] != " "){
            isNumber = true;
          }

          if(lines[k][j] != " " && isNumber == true){
            nums += lines[k][j];
          }

          if(lines[k][j] == " " && isNumber == true){
            try {
              lots.add(int.parse(nums));
              workInput2 += "$nums ";
            } catch (e) {
              stdout.write("Ошибка. В билете №${k-1} Лот \"$nums\" не является числом\n");
              workInput2 += "0 ";
            }
            nums = "";
            isNumber = false;
          }
        }
        tickets.addAll({numTicket : lots});
        ++numTicket;
        workInput2 += "\n";
      }
      countLines = k;
    }
  } catch (e) {
    print('Error: $e\n');
  }

  print("\nИсправляем ошибки в файле 'input.txt'");
  print("\n...\n");

  if(workInput == ""){
    workInput = "1 2 3 4 5 6 7 8 9 10 ";
    winLot = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  }

  workInput = workInput.substring(0, workInput.length - 1);
  workInput += "\n";

  if(countLines != n+1){
    n = countLines - 1;
  }

  if(workInput2 == ""){
    workInput2 = "0 0 0 0 0 0";
    tickets = {1 : [0, 0, 0, 0, 0, 0]};
    n = 1;
  }

  file = await File('input.txt').writeAsString("$workInput$n\n$workInput2");

  print("Ошибки исправлены...");

// ↓↓↓ Проверка билетов ↓↓↓

  for(int j = 1; j <= n; ++j){
    for(int f = 0; f < tickets[j]!.length; ++f){
      for(int k = 0; k < winLot.length; ++k){
        if(tickets[j]![f] == winLot[k]){
          ++countWinLot;
        }
      }
      if(countWinLot >= 3){
        resultTicket += "Lucky\n";
        break;
      }
    }
    if(countWinLot < 3){
      resultTicket += "Unlucky\n";
    }
    countWinLot = 0;
  }

  File out = await File('output.txt').writeAsString(resultTicket);

  print("\nПрограмма завершилась успешно...\n");
}