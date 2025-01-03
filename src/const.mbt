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
