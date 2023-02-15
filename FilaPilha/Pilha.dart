class Pilha<T> {
  List<T> _itens = [];

  void adicionar(T item) {
    _itens.add(item);
  }

  remove() {
    if (_itens.isNotEmpty) {
      return _itens.removeLast();
    }
    return null;
  }

  bool get isEmpty => _itens.isEmpty;
}

void main() {
  var pilhaTeste = Pilha();

  pilhaTeste.adicionar("teste1");
  pilhaTeste.adicionar("teste2");
  pilhaTeste.adicionar("teste3");

  print(pilhaTeste.remove());
  print(pilhaTeste.isEmpty);

  while (!pilhaTeste.isEmpty) {
    print(pilhaTeste.remove());
  }

  print(pilhaTeste.isEmpty);
}
