///|
pub fn rand_array[T](
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> T
) -> () -> Array[T] {
  fn() {
    let len = len()
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_unique[T : Eq + Hash](
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> T
) -> () -> Array[T] {
  fn() {
    let len = len()
    let arr = []
    let set = @hashset.new()
    for i in 0..<len {
      while true {
        let elem = gen()
        if set.contains(elem) {
          continue
        } else {
          set.add(elem)
          arr.push(elem)
          break
        }
      }
    }
    arr
  }
}

///|
pub fn arr_generator_concat[T](
  arr_gen~ : () -> Array[T],
  arr_gen_2~ : () -> Array[T]
) -> () -> Array[T] {
  fn() { arr_gen() + arr_gen_2() }
}
