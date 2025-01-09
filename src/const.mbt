///|
pub fn const_[T](x : T) -> () -> T {
  fn() { x }
}

///|
pub fn lock[T](f : () -> T) -> () -> T {
  let x = f()
  fn() { x }
}

///|
pub fn select[T](self : Gen, fl : Array[() -> T]) -> () -> T {
  let len = fl.length()
  fn() { fl[self.rand_int(0, len - 1)()]() }
}

///|
pub fn select_proportion[T](
  self : Gen,
  fl : Array[() -> T],
  p : Array[Int]
) -> () -> T {
  let len = fl.length()
  let sum = p.fold(init=0, fn { sum, elem => sum + elem })
  fn() {
    let r = self.rand_int(1, sum)()
    let mut acc = 0
    for i in 0..<len {
      acc += p[i]
      if r < acc {
        return fl[i]()
      }
    }
    fl[len - 1]()
  }
}
