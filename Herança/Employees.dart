import 'dart:io';

//classe abstrata
abstract class Employee {
  late String name;
  late double wage;
  late int hours;

  void status();
  Employee demote();
  Employee promote();

  void finalWage() {}
}

//Manager extendendo da classe pai
class Manager extends Employee {
  //Construtor de Manager
  Manager(String name, double wage, int hours) {
    this.name = name;
    this.wage = wage;
    this.hours = hours;
  }

  //metodo herdado que muda a classe de Manager para Seller, ambas subclasses
  Employee demote() {
    Employee tempSeller = Seller(name, 10, 210);
    return tempSeller;
  }

  //metodo herdado que, no caso de gerente, pode dar um aumento no salário
  Employee promote() {
    print(
        "Este employee já é um Gerente. Deseja aumentar o salário/h em 10 reais?(yes/no)");
    String asw = stdin.readLineSync() as String;
    if (asw[0] == 'y' || asw[0] == 'Y') {
      this.wage += 10;
      finalWage();
      return this;
    } else
      return this;
  }

  //metodo herdado que faz um print do status
  void status() {
    print("O funcionario $name é um Manager.");
  }

  //metodo herdado que calcula o wage final
  void finalWage() {
    double fwage = wage * hours;
    print("O wage final de $name é $fwage reais.");
  }
}

//Subclasse herdando de Employee
class Seller extends Employee {
  // Construtor de seller
  Seller(String name, double wage, int hours) {
    this.name = name;
    this.wage = wage;
    this.hours = hours;
  }

  //metodo herdado que muda a classe de Seller para unemployed, ambas subclasses
  Employee demote() {
    print("Realmente deseja demitir o seller $name?(yes/no)");
    String asw = stdin.readLineSync() as String;
    if (asw[0] == 'y' || asw[0] == 'Y') {
      print("Seller $name foi demitido!");
      Employee unemployed = Unemployed(this.name);
      return unemployed;
    } else
      print("Seller $name não foi demitido!");
    return this;
  }

  //metodo herdado que promove para gerente
  Employee promote() {
    Employee tempManager = Manager(name, 25, 150);
    return tempManager;
  }

  //metodo herdado que faz um print do status do objeto
  void status() {
    print("O funcionario $name é um Seller.");
  }

  //metodo herdado que calcula o wage final
  void finalWage() {
    double fwage = wage * hours;
    print("O wage final de $name é $fwage reais.");
  }
}

//Subclasse que herda de Employee
class Unemployed extends Employee {
  //Construtor de Unemployed
  Unemployed(String name) {
    this.name = name;
    this.wage = 0;
    this.hours = 0;
  }

  //Metodo herdado para rebaixar
  Employee demote() {
    print("$name já está sem emprego!");
    return this;
  }

  //metodo herdado para promover para Seller
  Employee promote() {
    print("$name promovido para Seller!");
    Employee tempSeller = Seller(this.name, 10, 210);
    return tempSeller;
  }

  //metodo herdado que faz um print do status do objeto
  void status() {
    print("$name está unemployed.");
  }

  //metodo herdado que calcula o wage final
  void finalWage() {
    double fwage = wage * hours;
    print("O wage final de $name é $fwage reais.");
  }
}

void main() {
  print("---------------");
  //criação dos objetos
  Employee employee1 = Manager("Alex", 30, 150);
  Employee employee2 = Seller("Nick", 12, 220);
  Employee employee3 = Unemployed("Joao");

  //status de cada um dos objetos
  employee1.finalWage();
  employee2.finalWage();
  employee3.finalWage();

  print("---------------");
  //demote do Seller
  employee2 = employee2.demote();
  employee2.status();

  print("---------------");
  //promoção do unemployed para Seller
  employee3 = employee3.promote();
  employee3.status();

  print("---------------");
  //promoção/aumento do Manager
  employee1 = employee1.promote();
  employee1.status();

  //print(employee2.runtimeType.toString());
}
