///|
enum Argument {
  Int(Int)
  Float(Float)
  Double(Double)
  String(String)
  Bool(Bool)
  Char(Char)
  Int64(Int64)
  UInt64(UInt64)
  UInt(UInt)
  ArrayInt(Array[Int])
  ArrayFloat(Array[Float])
  ArrayDouble(Array[Double])
  ArrayString(Array[String])
  ArrayBool(Array[Bool])
  ArrayChar(Array[Char])
  ArrayInt64(Array[Int64])
  ArrayUInt64(Array[UInt64])
  ArrayUInt(Array[UInt])
}

///|
struct Test {
  name : String
  arg : Array[(Array[Argument], Int)]
}

///|
fn Test::new(name~ : String, arg~ : Array[(Array[Argument], Int)]) -> Test {
  { name, arg }
}

///|
fn to_string(self : Argument) -> String {
  match self {
    Int(x) => x.to_string()
    Float(x) => x.to_string()
    Double(x) => x.to_string()
    String(x) => x
    Bool(x) => x.to_string()
    Char(x) => x.to_string()
    Int64(x) => x.to_string()
    UInt64(x) => x.to_string()
    UInt(x) => x.to_string()
    ArrayInt(x) => x.to_string()
    ArrayFloat(x) => x.to_string()
    ArrayDouble(x) => x.to_string()
    ArrayString(x) => x.to_string()
    ArrayBool(x) => x.to_string()
    ArrayChar(x) => x.to_string()
    ArrayInt64(x) => x.to_string()
    ArrayUInt64(x) => x.to_string()
    ArrayUInt(x) => x.to_string()
  }
}

///|
fn gen_arg_code(arg : Array[Argument]) -> String {
  let mut s = ""
  for i in 0..<arg.length() {
    if i == arg.length() - 1 {
      s += "\{to_string(arg[i])}"
    } else {
      s += "\{to_string(arg[i])},"
    }
  }
  s
}

///|
fn Test::run(self : Test, output_dir~ : String) -> Unit {
  let mut code = ""
  for x in self.arg {
    let (arg, idx) = x
    for i in 0..<idx {
      let arg_code = gen_arg_code(arg)
      code += "inspect!(\{self.name}(\{arg_code}))\n"
    }
  }
  let test_block =
    $|test "\{self.name}" {
    $|  \{code}
    $|}
  @fs.write_string_to_file(
    path=output_dir + "/" + self.name + ".mbt",
    content=test_block,
  )
}
