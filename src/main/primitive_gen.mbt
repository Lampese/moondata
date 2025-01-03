///|
struct MoonData {
  gen : @random.Rand
}

///|
pub fn MoonData::new(state~ : Bytes) -> MoonData {
  { gen: @random.new(seed=state) }
}

///|
pub fn rand_int(self : MoonData, l : Int, r : Int) -> () -> Int {
  let x = self.gen.int()
  fn() { l + x % (r - l + 1) }
}

///|
pub fn rand_float(self : MoonData, l : Float, r : Float) -> () -> Float {
  let x = self.gen.float()
  fn() { l + x * (r - l) }
}

///|
pub fn rand_double(self : MoonData, l : Double, r : Double) -> () -> Double {
  let x = self.gen.double()
  fn() { l + x * (r - l) }
}

///|
pub fn rand_bool(self : MoonData) -> () -> Bool {
  let x = self.gen.int()
  fn() { x % 2 == 0 }
}

///|
pub fn rand_uint(self : MoonData, l : UInt, r : UInt) -> () -> UInt {
  let x = self.gen.uint()
  fn() { l + x % (r - l + 1) }
}

///|
pub fn rand_int64(self : MoonData, l : Int64, r : Int64) -> () -> Int64 {
  let x = self.gen.int64()
  fn() { l + x % (r - l + 1) }
}

///|
pub fn rand_uint64(self : MoonData, l : UInt64, r : UInt64) -> () -> UInt64 {
  let x = self.gen.uint64()
  fn() { l + x % (r - l + 1) }
}

///|
pub fn rand_char(self : MoonData) -> () -> Char {
  let x = self.rand_int(0, 255)
  fn() { Char::from_int(x()) }
}

///|
pub fn rand_string(
  self : MoonData,
  len~ : () -> Int = self.rand_int(1, 10),
  char_gen~ : () -> Char
) -> String {
  let len = len()
  let mut s = ""
  for _ in 0..<len {
    s += char_gen().to_string()
  }
  s
}
