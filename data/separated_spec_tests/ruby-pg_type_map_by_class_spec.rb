# -*- rspec -*-
# encoding: utf-8

require_relative '../helpers'

require 'pg'


describe PG::TypeMapByClass do

	let!(:textenc_int){ PG::TextEncoder::Integer.new name: 'INT4', oid: 23 }
	let!(:textenc_float){ PG::TextEncoder::Float.new name: 'FLOAT8', oid: 701 }
	let!(:textenc_string){ PG::TextEncoder::String.new name: 'TEXT', oid: 25 }
	let!(:binaryenc_int){ PG::BinaryEncoder::Int8.new name: 'INT8', oid: 20, format: 1 }
	let!(:pass_through_type) do
		type = Class.new(PG::SimpleEncoder) do
			def encode(*v)
				v.inspect
			end
		end.new
		type.oid = 25
		type.format = 0
		type.name = 'pass_through'
		type
	end

	let!(:tm) do
		tm = PG::TypeMapByClass.new
		tm[Integer] = binaryenc_int
		tm[Float] = textenc_float
		tm[Symbol] = pass_through_type
		tm
	end

	let!(:raise_class) do
		Class.new
	end

	let!(:derived_tm) do
		tm = Class.new(PG::TypeMapByClass) do
			def array_type_map_for(value)
				PG::TextEncoder::Array.new name: '_INT4', oid: 1007, elements_type: PG::TextEncoder::Integer.new
			end
		end.new
		tm[Integer] = proc{|value| textenc_int }
		tm[raise_class] = proc{|value| /invalid/ }
		tm[Array] = :array_type_map_for
		tm
	end

	it "should retrieve all conversions" 


	it "should retrieve particular conversions" 


	it "should allow deletion of coders" 


	it "forwards query param conversions to the #default_type_map" 


	#
	# Decoding Examples
	#

	it "should raise an error when used for results" 


	#
	# Encoding Examples
	#

	it "should allow mixed type conversions" 


	it "should expire the cache after changes to the coders" 


	it "should allow mixed type conversions with derived type map" 


	it "should raise TypeError with derived type map" 


	it "should raise error on invalid coder object" 

end

