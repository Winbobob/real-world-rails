#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe "Function with primitive integer arguments" do
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    attach_function :ret_s8, [ :char ], :char
    attach_function :ret_u8, [ :uchar ], :uchar
    attach_function :ret_s16, [ :short ], :short
    attach_function :ret_u16, [ :ushort ], :ushort
    attach_function :ret_s32, [ :int ], :int
    attach_function :ret_u32, [ :uint ], :uint
    attach_function :ret_s64, [ :long_long ], :long_long
    attach_function :ret_u64, [ :ulong_long ], :ulong_long
    attach_function :ret_long, [ :long ], :long
    attach_function :ret_ulong, [ :ulong ], :ulong
    attach_function :set_s8, [ :char ], :void
    attach_function :get_s8, [ ], :char
    attach_function :set_float, [ :float ], :void
    attach_function :get_float, [ ], :float
    attach_function :set_double, [ :double ], :void
    attach_function :get_double, [ ], :double
  end

  it "int8.size" 


  it "uint8.size" 


  it "int16.size" 


  it "uint16.size" 


  it "int32.size" 


  it "uint32.size" 


  it "int64.size" 


  it "uint64.size" 


  it "float.size" 


  it "double.size" 

  [ 0, 127, -128, -1 ].each do |i|
    it ":char call(:char (#{i}))" 

  end
  [ 0, 0x7f, 0x80, 0xff ].each do |i|
    it ":uchar call(:uchar (#{i}))" 

  end
  [ 0, 0x7fff, -0x8000, -1 ].each do |i|
    it ":short call(:short (#{i}))" 

  end
  [ 0, 0x7fff, 0x8000, 0xffff ].each do |i|
    it ":ushort call(:ushort (#{i}))" 

  end
  [ 0, 0x7fffffff, -0x80000000, -1 ].each do |i|
    it ":int call(:int (#{i}))" 

  end
  [ 0, 0x7fffffff, 0x80000000, 0xffffffff ].each do |i|
    it ":uint call(:uint (#{i}))" 

  end
  [ 0, 0x7fffffffffffffff, -0x8000000000000000, -1 ].each do |i|
    it ":long_long call(:long_long (#{i}))" 

  end
  [ 0, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff ].each do |i|
    it ":ulong_long call(:ulong_long (#{i}))" 

  end
  if FFI::Platform::LONG_SIZE == 32
    [ 0, 0x7fffffff, -0x80000000, -1 ].each do |i|
      it ":long call(:long (#{i}))" 

    end
    [ 0, 0x7fffffff, 0x80000000, 0xffffffff ].each do |i|
      it ":ulong call(:ulong (#{i}))" 

    end
  else
    [ 0, 0x7fffffffffffffff, -0x8000000000000000, -1 ].each do |i|
      it ":long call(:long (#{i}))" 

    end
    [ 0, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff ].each do |i|
      it ":ulong call(:ulong (#{i}))" 

    end
    [ 0.0, 0.1, 1.1, 1.23 ].each do |f|
      it ":float call(:double (#{f}))" 

    end
    [ 0.0, 0.1, 1.1, 1.23 ].each do |f|
      it ":double call(:double (#{f}))" 

    end
  end
end
describe "Integer parameter range checking" do
  [ 128, -129 ].each do |i|
    it ":char call(:char (#{i}))" 

  end
  [ -1, 256 ].each do |i|
    it ":uchar call(:uchar (#{i}))" 

  end
  [ 0x8000, -0x8001 ].each do |i|
    it ":short call(:short (#{i}))" 

  end
  [ -1, 0x10000 ].each do |i|
    it ":ushort call(:ushort (#{i}))" 

  end
  [ 0x80000000, -0x80000001 ].each do |i|
    it ":int call(:int (#{i}))" 

  end
  [ -1, 0x100000000 ].each do |i|
    it ":ushort call(:ushort (#{i}))" 

  end
end
describe "Three different size Integer arguments" do
  TYPE_MAP = {
    's8' => :char, 'u8' => :uchar, 's16' => :short, 'u16' => :ushort,
    's32' => :int, 'u32' => :uint, 's64' => :long_long, 'u64' => :ulong_long,
    'sL' => :long, 'uL' => :ulong, 'f32' => :float, 'f64' => :double
  }
  TYPES = TYPE_MAP.keys
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    
    
    [ 's32', 'u32', 's64', 'u64' ].each do |rt|
      TYPES.each do |t1|
        TYPES.each do |t2|
          TYPES.each do |t3|
            begin
              attach_function "pack_#{t1}#{t2}#{t3}_#{rt}",
                [ TYPE_MAP[t1], TYPE_MAP[t2], TYPE_MAP[t3], :buffer_out ], :void
            rescue FFI::NotFoundError
            end
          end
        end
      end
    end
  end

  PACK_VALUES = {
    's8' => [ 0x12  ],
    'u8' => [ 0x34  ],
    's16' => [ 0x5678 ],
    'u16' => [ 0x9abc ],
    's32' => [ 0x7654321f ],
    'u32' => [ 0xfee1babe ],
    'sL' => [ 0x1f2e3d4c ],
    'uL' => [ 0xf7e8d9ca ],
    's64' => [ 0x1eafdeadbeefa1b2 ],
#    'f32' => [ 1.234567 ],
    'f64' => [ 9.87654321 ]
  }

  def verify(p, off, t, v)
    if t == 'f32'
      expect(p.get_float32(off)).to eq(v)
    elsif t == 'f64'
      expect(p.get_float64(off)).to eq(v)
    else
      expect(p.get_int64(off)).to eq(v)
    end
  end

  PACK_VALUES.keys.each do |t1|
    PACK_VALUES.keys.each do |t2|
      PACK_VALUES.keys.each do |t3|
        PACK_VALUES[t1].each do |v1|
          PACK_VALUES[t2].each do |v2|
            PACK_VALUES[t3].each do |v3|
              it "call(#{TYPE_MAP[t1]} (#{v1}), #{TYPE_MAP[t2]} (#{v2}), #{TYPE_MAP[t3]} (#{v3}))" 

            end
          end
        end
      end
    end
  end
end

