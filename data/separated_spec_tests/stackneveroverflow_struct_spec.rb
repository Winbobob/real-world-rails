#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe "Struct aligns fields correctly" do
  it "char, followed by an int" 


  it "short, followed by an int" 


  it "int, followed by an int" 


  it "long long, followed by an int" 

end

describe "Struct tests" do
  StructTypes = {
    's8' => :char,
    's16' => :short,
    's32' => :int,
    's64' => :long_long,
    'long' => :long,
    'f32' => :float,
    'f64' => :double
  }
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    attach_function :ptr_ret_pointer, [ :pointer, :int], :string
    begin
      attach_function :ptr_ret_int32_t, [ :pointer, :int ], :int
    rescue FFI::NotFoundError
      # NetBSD uses #define instead of typedef for these
      attach_function :ptr_ret_int32_t, :ptr_ret___int32_t, [ :pointer, :int ], :int
    end
    attach_function :ptr_from_address, [ :ulong ], :pointer
    attach_function :string_equals, [ :string, :string ], :int
    [ 's8', 's16', 's32', 's64', 'f32', 'f64', 'long' ].each do |t|
      attach_function "struct_align_#{t}", [ :pointer ], StructTypes[t]
    end
  end
  class PointerMember < FFI::Struct
    layout :pointer, :pointer
  end
  class StringMember < FFI::Struct
    layout :string, :string
  end

  it "Struct#[:pointer]" 


  it "Struct#[:pointer].nil? for NULL value" 


  it "Struct#[:pointer]=" 


  it "Struct#[:pointer]=struct" 


  it "Struct#[:pointer]=nil" 


  it "Struct#[:string]" 


  it "Struct#[:string].nil? for NULL value" 


  it "Struct#layout works with :name, :type pairs" 


  it "Struct#layout works with :name, :type, offset tuples" 


  it "Struct#layout works with mixed :name,:type and :name,:type,offset" 


  rb_maj, rb_min = RUBY_VERSION.split('.')
  if rb_maj.to_i >= 1 && rb_min.to_i >= 9 || RUBY_PLATFORM =~ /java/
    it "Struct#layout withs with a hash of :name => type" 

  end

  it "subclass overrides initialize without calling super" 


  it "Can use Struct subclass as parameter type" 


  it "Can use Struct subclass as IN parameter type" 


  it "Can use Struct subclass as OUT parameter type" 


  it "can be passed directly as a :pointer parameter" 


  it ":char member aligned correctly" 


  it ":short member aligned correctly" 


  it ":int member aligned correctly" 


  it ":long_long member aligned correctly" 


  it ":long member aligned correctly" 


  it ":float member aligned correctly" 


  it ":double member aligned correctly" 


  it ":ulong, :pointer struct" 

  def test_num_field(type, v)
    klass = Class.new(FFI::Struct)
    klass.layout :v, type, :dummy, :long

    s = klass.new
    s[:v] = v
    expect(s.pointer.send("get_#{type.to_s}", 0)).to eq(v)
    s.pointer.send("put_#{type.to_s}", 0, 0)
    expect(s[:v]).to eq(0)
  end
  def self.int_field_test(type, values)
    values.each do |v|
      it "#{type} field r/w (#{v.to_s(16)})" 

    end
  end
  int_field_test(:char, [ 0, 127, -128, -1 ])
  int_field_test(:uchar, [ 0, 0x7f, 0x80, 0xff ])
  int_field_test(:short, [ 0, 0x7fff, -0x8000, -1 ])
  int_field_test(:ushort, [ 0, 0x7fff, 0x8000, 0xffff ])
  int_field_test(:int, [ 0, 0x7fffffff, -0x80000000, -1 ])
  int_field_test(:uint, [ 0, 0x7fffffff, 0x80000000, 0xffffffff ])
  int_field_test(:long_long, [ 0, 0x7fffffffffffffff, -0x8000000000000000, -1 ])
  int_field_test(:ulong_long, [ 0, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff ])
  if FFI::Platform::LONG_SIZE == 32
    int_field_test(:long, [ 0, 0x7fffffff, -0x80000000, -1 ])
    int_field_test(:ulong, [ 0, 0x7fffffff, 0x80000000, 0xffffffff ])
  else
    int_field_test(:long, [ 0, 0x7fffffffffffffff, -0x8000000000000000, -1 ])
    int_field_test(:ulong, [ 0, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff ])
  end

  it ":float field r/w" 


  it ":double field r/w" 

  module EnumFields
    extend FFI::Library
    TestEnum = enum :test_enum, [:c1, 10, :c2, 20, :c3, 30, :c4, 40]
    class TestStruct < FFI::Struct
      layout :a, :int, :c, :test_enum,
        :d, [ TestEnum, TestEnum.symbols.length ]
    end
  end

  it ":enum field r/w" 


  it "array of :enum field" 


  module CallbackMember
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    callback :add, [ :int, :int ], :int
    callback :sub, [ :int, :int ], :int
    class TestStruct < FFI::Struct
      layout :add, :add,
        :sub, :sub
    end
    attach_function :struct_call_add_cb, [TestStruct.in, :int, :int], :int
    attach_function :struct_call_sub_cb, [TestStruct.in, :int, :int], :int
  end

  it "Can have CallbackInfo struct field" 


  it "Can return its members as a list" 


  it "Can return its instance members and values as lists" 


  it 'should return an ordered field/offset pairs array' 


  it "Struct#offset_of returns offset of field within struct" 

end

describe FFI::Struct, ".layout" do
  module FFISpecs
    module LibTest
      extend FFI::Library
      ffi_lib TestLibrary::PATH
      begin
        attach_function :ptr_ret_int32_t, [ :pointer, :int ], :int
      rescue FFI::NotFoundError
        # NetBSD uses #define instead of typedef for these
        attach_function :ptr_ret_int32_t, :ptr_ret___int32_t, [ :pointer, :int ], :int
      end
    end
  end

  describe "when derived class is not assigned to any constant" do
    it "resolves a built-in type" 

  end

  describe "when derived class is assigned to a constant" do
    it "resolves a built-in type" 


    it "resolves a type from the enclosing module" 

  end
end

describe FFI::Struct, ' with a nested struct field'  do
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    class NestedStruct < FFI::Struct
      layout :i, :int
    end
    class ContainerStruct < FFI::Struct
      layout :first, :char, :ns, NestedStruct
    end
    attach_function :struct_align_nested_struct, [ :pointer ], :int
    attach_function :struct_make_container_struct, [ :int ], :pointer
  end
  before do
    @cs = LibTest::ContainerStruct.new
  end

  it 'should align correctly nested struct field' 


  it 'should correctly calculate Container size (in bytes)' 


  it 'should return a Struct object when the field is accessed' 


  it 'should read a value from memory' 


  it 'should write a value to memory' 


  it 'should be able to assign struct instance to nested field' 

end

describe FFI::Struct, ' with a nested array of structs'  do
  module InlineArrayOfStructs
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    class NestedStruct < FFI::Struct
      layout :i, :int
    end
    class ContainerStruct < FFI::Struct
      layout :first, :char, :ns, [ NestedStruct, 1 ]
    end
    attach_function :struct_align_nested_struct, [ :pointer ], :int
    attach_function :struct_make_container_struct, [ :int ], :pointer
  end

  before do
    @cs = InlineArrayOfStructs::ContainerStruct.new
  end

  it 'should align correctly nested struct field' 


  it 'should correctly calculate Container size (in bytes)' 


  it 'should return a Struct object when the field is accessed' 


  it 'should read a value from memory' 


  it 'should write a value to memory' 


  it 'should support Enumerable#each' 

end

describe FFI::Struct, ' by value'  do
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH

    class S8S32 < FFI::Struct
      layout :s8, :char, :s32, :int
    end

    class StructString < FFI::Struct
      layout :bytes, :string, :len, :int
    end

    attach_function :struct_return_s8s32, [ ], S8S32.by_value
    attach_function :struct_s8s32_set, [ :char, :int ], S8S32.by_value
    attach_function :struct_s8s32_get_s8, [ S8S32.by_value ], :char
    attach_function :struct_s8s32_get_s32, [ S8S32.by_value ], :int
    attach_function :struct_s8s32_s32_ret_s32, [ S8S32.by_value, :int ], :int
    attach_function :struct_s8s32_s64_ret_s64, [ S8S32.by_value, :long_long ], :long_long
    attach_function :struct_s8s32_ret_s8s32, [ S8S32.by_value ], S8S32.by_value
    attach_function :struct_s32_ptr_s32_s8s32_ret_s32, [ :int, :pointer, :int, S8S32.by_value ], :int
    attach_function :struct_varargs_ret_struct_string, [ :int, :varargs ], StructString.by_value
  end

  it 'return using pre-set values' 


  it 'return using passed in values' 


  it 'parameter' 


  it 'parameter with following s32' 


  # it 'parameter with following s64' do
  #   s = LibTest::S8S64.new
  #   s[:s8] = 0x12
  #   s[:s64] = 0x34567890
  #
  #
  #   LibTest.struct_s8s64_s64_ret_s64(s, 0x1eefdead1eefdead).should == 0x1eefdead1eefdead
  # end

  it 'parameter with preceding s32,ptr,s32' 


  it 'parameter with preceding s32,string,s32' 


  it 'parameter, returning struct by value' 


  it 'varargs returning a struct' 

end

describe FFI::Struct, ' with an array field'  do
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    class StructWithArray < FFI::Struct
      layout :first, :char, :a, [:int, 5]
    end
    attach_function :struct_make_struct_with_array, [:int, :int, :int, :int, :int], :pointer
    attach_function :struct_field_array, [:pointer], :pointer
  end
  before do
    @s = LibTest::StructWithArray.new
  end

  it 'should correctly calculate StructWithArray size (in bytes)' 


  it 'should read values from memory' 

#  it 'should cache array object for successive calls' do
#    @s[:a].object_id.should == @s[:a].object_id
#  end

  it 'should return the number of elements in the array field' 


  it 'should allow iteration through the array elements' 


  it 'should return the pointer to the array' 

end

describe 'BuggedStruct' do
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    class BuggedStruct < FFI::Struct
      layout :visible, :uchar,
              :x, :uint,
              :y, :uint,
              :rx, :short,
              :ry, :short,
              :order, :uchar,
              :size, :uchar
    end
    attach_function :bugged_struct_size, [], :uint
  end

  it 'should return its correct size' 


  it "offsets within struct should be correct" 


  it 'should return correct field/offset pairs' 

end

describe "Struct allocation" do
  it "MemoryPointer.new(Struct, 2)" 


  it "Buffer.new(Struct, 2)" 


  it "null? should be true when initialized with NULL pointer" 


  it "null? should be false when initialized with non-NULL pointer" 


  it "supports :bool as a struct member" 


end

describe "variable-length arrays" do
  it "zero length array should be accepted as last field" 


  it "zero length array before last element should raise error" 


  it "can access elements of array" 


  it "non-variable length array is bounds checked" 

end

