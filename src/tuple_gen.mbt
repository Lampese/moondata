///|
pub fn rand_tuple_2[T, U](gen_t~ : () -> T, gen_u~ : () -> U) -> () -> (T, U) {
  fn() { (gen_t(), gen_u()) }
}
