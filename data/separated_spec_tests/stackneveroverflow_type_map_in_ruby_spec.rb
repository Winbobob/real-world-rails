#!/usr/bin/env rspec
# encoding: utf-8

require_relative '../helpers'

require 'pg'


describe PG::TypeMapInRuby do

	context "result values" do
		it "should be usable non-derived" 


		it "should call derived result mapping methods" 


				def typecast_result_value(*args)
					[args, super]
				end
			end.new

			res = @conn.exec("select 5,6").map_types!(tm)
			expect( res.getvalue(0,1) ).to eq( [[res, 0, 1], "6"] )
			expect( tm.fit_to_result_args ).to eq( [res] )
		end

		it "should accept only a type map object from fit_to_result" 

			end.new

			res = @conn.exec("select 5,6")
			expect{ res.map_types!(tm) }.to raise_error(TypeError, /kind of PG::TypeMap/)
		end
	end

	context "query bind params" do
		it "should be usable non-derived" 


		it "should call derived param mapping methods" 


				def typecast_query_param(*args)
					@typecast_query_param_args << [args, super]
					PG::TextEncoder::Integer.new name: 'INT4', oid: 23
				end
			end.new

			res = @conn.exec_params("select $1, $2", [5, 6], 0, tm)
			expect( res.ftype(0) ).to eq( 23 )
			expect( tm.fit_to_query_args ).to eq( [5, 6] )
			expect( tm.typecast_query_param_args ).to eq( [[[5, 0], nil], [[6, 1], nil]] )
		end
	end

	context "put_copy_data" do
		it "should be usable non-derived" 


		it "should call derived data mapping methods" 


				def typecast_query_param(*args)
					@typecast_query_param_args << [args, super]
					PG::TextEncoder::Integer.new name: 'INT4', oid: 23
				end
			end.new

			ce = PG::TextEncoder::CopyRow.new type_map: tm
			res = ce.encode([5, 6])
			expect( res ).to eq( "5\t6\n" )
			expect( tm.fit_to_query_args ).to eq( [5, 6] )
			expect( tm.typecast_query_param_args ).to eq( [[[5, 0], nil], [[6, 1], nil]] )
		end

		it "shouldn't accept invalid return from typecast_query_param" 

			end.new

			ce = PG::TextEncoder::CopyRow.new type_map: tm
			expect{ ce.encode([5, 6]) }.to raise_error(TypeError, /nil or kind of PG::Coder/)
		end
	end

	context "get_copy_data" do
		it "should be usable non-derived" 


		it "should call derived data mapping methods" 


				def typecast_copy_get(field_str, fieldno, format, enc)
					[field_str, fieldno, format, enc, super]
				end
			end.new

			ce = PG::TextDecoder::CopyRow.new type_map: tm
			res = ce.decode("5\t6\n")
			expect( tm.fit_to_copy_get_args ).to eq( [] )
			expect( res ).to eq( [["5", 0, 0, Encoding::UTF_8, "5"], ["6", 1, 0, Encoding::UTF_8, "6"]] )
		end

		it "shouldn't accept invalid return from fit_to_copy_get" 

			end.new

			ce = PG::TextDecoder::CopyRow.new type_map: tm
			expect{ ce.decode("5\t6\n") }.to raise_error(TypeError, /kind of Integer/)
		end
	end

end

