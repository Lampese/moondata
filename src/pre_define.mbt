///|
pub fn lower_alpha(self : Gen) -> () -> Char {
  fn() { "abcdefghijklmnopqrstuvwxyz"[self.rand_int(0, 25)()] }
}

///|
pub fn upper_alpha(self : Gen) -> () -> Char {
  fn() { "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[self.rand_int(0, 25)()] }
}

///|
pub fn digit_char(self : Gen) -> () -> Char {
  fn() { "0123456789"[self.rand_int(0, 9)()] }
}

///|
pub fn alpha(self : Gen) -> () -> Char {
  select(self, [self.lower_alpha(), self.upper_alpha()])
}

///|
pub fn alpha_and_digit(self : Gen) -> () -> Char {
  select(self, [self.alpha(), self.digit_char()])
}
