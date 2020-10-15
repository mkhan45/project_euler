object Main extends App {
  var example = generator[Int] {prduce =>
    var tup = (0, 2)
    while (true) {
      tup = (tup[1], 4 * tup[1] * tup[0])
      produce(tup[1])
    }
  }
}
