///|
pub fn rand_array_int(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> Int
) -> () -> Array[Int] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_char(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> Char
) -> () -> Array[Char] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_string(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> String
) -> () -> Array[String] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_bool(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> Bool
) -> () -> Array[Bool] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_float(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> Float
) -> () -> Array[Float] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_arrar_double(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> Double
) -> () -> Array[Double] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_uint(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> UInt
) -> () -> Array[UInt] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_int64(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> Int64
) -> () -> Array[Int64] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
    }
    arr
  }
}

///|
pub fn rand_array_uint64(
  self : Gen,
  len~ : () -> Int = self.rand_int(1, 10),
  gen~ : () -> UInt64
) -> () -> Array[UInt64] {
  let len = len()
  fn() {
    let arr = []
    for i in 0..<len {
      arr.push(gen())
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
