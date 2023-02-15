import "dart:io";

void main() {
  stdout.writeln("whrite line");
  String? line = stdin.readLineSync();
  print('$line');
}
