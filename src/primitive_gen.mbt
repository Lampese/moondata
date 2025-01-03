///|
struct Gen {
  gen : @random.Rand
}

///|
pub fn Gen::new(state~ : Bytes = b"ABCDEFGHIJKLMNOPQRSTUVWXYZ123456") -> Gen {
  { gen: @random.new(seed=state) }
}

///|
pub fn rand_int(self : Gen, l : Int, r : Int) -> () -> Int {
  fn() { l + self.gen.int() % (r - l + 1) }
}

///|
pub fn rand_float(self : Gen, l : Float, r : Float) -> () -> Float {
  fn() { l + self.gen.float() * (r - l) }
}

///|
pub fn rand_double(self : Gen, l : Double, r : Double) -> () -> Double {
  fn() { l + self.gen.double() * (r - l) }
}

///|
pub fn rand_bool(self : Gen) -> () -> Bool {
  fn() { self.gen.int() % 2 == 0 }
}

///|
pub fn rand_uint(self : Gen, l : UInt, r : UInt) -> () -> UInt {
  fn() { l + self.gen.uint() % (r - l + 1) }
}

///|
pub fn rand_int64(self : Gen, l : Int64, r : Int64) -> () -> Int64 {
  fn() { l + self.gen.int64() % (r - l + 1) }
}

///|
pub fn rand_uint64(self : Gen, l : UInt64, r : UInt64) -> () -> UInt64 {
  fn() { l + self.gen.uint64() % (r - l + 1) }
}

///|
pub fn rand_char(self : Gen) -> () -> Char {
  fn() { Char::from_int(self.rand_int(0, 255)()) }
}

///|
pub fn rand_char_range(self : Gen, l : Int, r : Int) -> () -> Char {
  fn() { Char::from_int(self.rand_int(l, r)()) }
}

///|
pub fn rand_string(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  char_gen~ : () -> Char
) -> () -> String {
  let len = len()
  fn() {
    let mut s = ""
    for _ in 0..<len {
      s += char_gen().to_string()
    }
    s
  }
}
