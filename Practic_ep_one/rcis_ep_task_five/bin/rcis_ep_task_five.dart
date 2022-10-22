import 'package:rcis_ep_task_five/rcis_ep_task_five.dart' as rcis_ep_task_five;
import 'dart:io';

void main(List<String> arguments) {
  String out = "Start ";
  stdout.write("Введите предложение: ");
  String words = stdin.readLineSync()!;
  words += " ";
  out += words + "End";

  int count = 0;

  bool isWord = false;
  for(int i = 0; i < words.length; ++i){
    if(words[i] != " ") {
      isWord = true;
    }
    if(words[i] == " " && isWord == true){
      ++count;
      isWord = false;
    }
  }
  
  print("Количество слов в предложении: $count");
  print(out);
}
