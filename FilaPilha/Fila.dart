class Fila<T> {
  List<T> _fila = [];

  void adicionaFila(T item) {
    _fila.add(item);
  }

  removeFila() {
    if (_fila.isNotEmpty) {
      return _fila.removeAt(0);
    }
    return null;
  }

  peek() {
    if (_fila.isNotEmpty) {
      return _fila[0];
    }
    return null;
  }

  int tamanho() {
    return _fila.length;
  }

  bool isEmpty() {
    return _fila.isEmpty;
  }

  void clear() {
    _fila.clear();
  }
}

void main() {
  Fila filaTeste = Fila();

  filaTeste.adicionaFila("Alex");
  filaTeste.adicionaFila("Elon Musk");
  filaTeste.adicionaFila("Elton John");

  print(filaTeste.peek());

  filaTeste.removeFila();

  print(filaTeste.peek());

  print(filaTeste.tamanho());

  filaTeste.clear();
  print(filaTeste.isEmpty());
}
