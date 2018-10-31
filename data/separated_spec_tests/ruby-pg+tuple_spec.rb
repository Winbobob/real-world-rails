# -*- rspec -*-
# encoding: utf-8

require_relative '../helpers'
require 'pg'
require 'objspace'

describe PG::Tuple do
	let!(:typemap) { PG::BasicTypeMapForResults.new(@conn) }
	let!(:result2x2) { @conn.exec( "VALUES(1, 'a'), (2, 'b')" ) }
	let!(:result2x3cast) { @conn.exec( "SELECT * FROM (VALUES(1, TRUE, '3'), (2, FALSE, '4')) AS m (a, b, b)" ).map_types!(typemap) }
	let!(:tuple0) { result2x2.tuple(0) }
	let!(:tuple1) { result2x2.tuple(1) }
	let!(:tuple2) { result2x3cast.tuple(0) }
	let!(:tuple3) { str = Marshal.dump(result2x3cast.tuple(1)); Marshal.load(str) }
	let!(:tuple_empty) { PG::Tuple.new }

	describe "[]" do
		it "returns nil for invalid keys" 


		it "supports array like access" 


		it "supports negative indices" 


		it "supports hash like access" 


		it "casts lazy and caches result" 

			end.new

			result2x2.map_types!(PG::TypeMapByColumn.new([deco, deco]))
			t = result2x2.tuple(1)

			# cast and cache at first call to [0]
			a.clear
			expect( t[0] ).to eq( 0 )
			expect( a ).to eq([["2", 1, 0]])

			# use cache at second call to [0]
			a.clear
			expect( t[0] ).to eq( 0 )
			expect( a ).to eq([])

			# cast and cache at first call to [1]
			a.clear
			expect( t[1] ).to eq( 1 )
			expect( a ).to eq([["b", 1, 1]])
		end
	end

	describe "fetch" do
		it "raises proper errors for invalid keys" 


		it "supports array like access" 


		it "supports default value for indices" 


		it "supports negative indices" 


		it "supports hash like access" 


		it "supports default value for name keys" 

	end

	describe "each" do
		it "can be used as an enumerator" 


		it "can be used with block" 

			expect( a ).to eq( [["column1", "1"], ["column2", "a"]] )
		end
	end

	describe "each_value" do
		it "can be used as an enumerator" 


		it "can be used with block" 

			expect( a ).to eq( ["1", "a"] )
		end
	end

	it "responds to values" 


	it "responds to key?" 


	it "responds to keys" 


	describe "each_key" do
		it "can be used as an enumerator" 


		it "can be used with block" 

			expect( a ).to eq( ["column1", "column2"] )
		end
	end

	it "responds to length" 


	it "responds to index" 


	it "can be used as Enumerable" 


	it "can be marshaled" 

	end

	it "passes instance variables when marshaled" 


	it "can't be marshaled when empty" 


	it "should give account about memory usage" 


	it "should override #inspect" 


	context "with cleared result" do
		it "should raise an error when non-materialized fields are used" 

	end
end

