///|
pub fn lock[T](f : () -> T) -> () -> T {
  let x = f()
  fn() { x }
}
