# -*- rspec -*-
# encoding: utf-8

require_relative '../helpers'

require 'pg'

describe 'Basic type mapping' do

	describe PG::BasicTypeMapForQueries do
		let!(:basic_type_mapping) do
			PG::BasicTypeMapForQueries.new @conn
		end

		#
		# Encoding Examples
		#

		it "should do basic param encoding", :ruby_19 do
			res = @conn.exec_params( "SELECT $1::int8,$2::float,$3,$4::TEXT",
				[1, 2.1, true, "b"], nil, basic_type_mapping )

			expect( res.values ).to eq( [
					[ "1", "2.1", "t", "b" ],
			] )

			expect( result_typenames(res) ).to eq( ['bigint', 'double precision', 'boolean', 'text'] )
		end

		it "should do array param encoding" 

	end



	describe PG::BasicTypeMapForResults do
		let!(:basic_type_mapping) do
			PG::BasicTypeMapForResults.new @conn
		end

		#
		# Decoding Examples
		#

		it "should do OID based type conversions", :ruby_19 do
			res = @conn.exec( "SELECT 1, 'a', 2.0::FLOAT, TRUE, '2013-06-30'::DATE, generate_series(4,5)" )
			expect( res.map_types!(basic_type_mapping).values ).to eq( [
					[ 1, 'a', 2.0, true, Date.new(2013,6,30), 4 ],
					[ 1, 'a', 2.0, true, Date.new(2013,6,30), 5 ],
			] )
		end

		#
		# Decoding Examples text+binary format converters
		#

		describe "connection wide type mapping" do
			before :each do
				@conn.type_map_for_results = basic_type_mapping
			end

			after :each do
				@conn.type_map_for_results = PG::TypeMapAllStrings.new
			end

			it "should do boolean type conversions" 

			end

			it "should do binary type conversions" 

			end

			it "should do integer type conversions" 

			end

			it "should do string type conversions" 

			end

			it "should do float type conversions" 

			end

			it "should do datetime without time zone type conversions" 

			end

			it "should do datetime with time zone type conversions" 

			end

			it "should do date type conversions" 

			end

			it "should do JSON conversions", :postgresql_94 do
				[0].each do |format|
					['JSON', 'JSONB'].each do |type|
						res = @conn.exec( "SELECT CAST('123' AS #{type}),
																			CAST('12.3' AS #{type}),
																			CAST('true' AS #{type}),
																			CAST('false' AS #{type}),
																			CAST('null' AS #{type}),
																			CAST('[1, \"a\", null]' AS #{type}),
																			CAST('{\"b\" : [2,3]}' AS #{type})", [], format )
						expect( res.getvalue(0,0) ).to eq( 123 )
						expect( res.getvalue(0,1) ).to be_within(0.1).of( 12.3 )
						expect( res.getvalue(0,2) ).to eq( true )
						expect( res.getvalue(0,3) ).to eq( false )
						expect( res.getvalue(0,4) ).to eq( nil )
						expect( res.getvalue(0,5) ).to eq( [1, "a", nil] )
						expect( res.getvalue(0,6) ).to eq( {"b" => [2, 3]} )
					end
				end
			end

			it "should do array type conversions" 

			end
		end

		context "with usage of result oids for copy decoder selection" do
			it "can type cast #copy_data output with explicit decoder" 

				end
				expect( rows ).to eq( [['a', 123, [5,4,3]], ['b', 234, [2,3]]] )
			end
		end
	end


	describe PG::BasicTypeMapBasedOnResult do
		let!(:basic_type_mapping) do
			PG::BasicTypeMapBasedOnResult.new @conn
		end

		context "with usage of result oids for bind params encoder selection" do
			it "can type cast query params" 


			it "can do JSON conversions", :postgresql_94 do
				['JSON', 'JSONB'].each do |type|
					sql = "SELECT CAST('123' AS #{type}),
						CAST('12.3' AS #{type}),
						CAST('true' AS #{type}),
						CAST('false' AS #{type}),
						CAST('null' AS #{type}),
						CAST('[1, \"a\", null]' AS #{type}),
						CAST('{\"b\" : [2,3]}' AS #{type})"

					tm = basic_type_mapping.build_column_map( @conn.exec( sql ) )
					expect( tm.coders.map(&:name) ).to eq( [type.downcase] * 7 )

					res = @conn.exec_params( "SELECT $1, $2, $3, $4, $5, $6, $7",
						[ 123,
							12.3,
							true,
							false,
							nil,
							[1, "a", nil],
							{"b" => [2, 3]},
						], 0, tm )

					expect( res.getvalue(0,0) ).to eq( "123" )
					expect( res.getvalue(0,1) ).to eq( "12.3" )
					expect( res.getvalue(0,2) ).to eq( "true" )
					expect( res.getvalue(0,3) ).to eq( "false" )
					expect( res.getvalue(0,4) ).to eq( nil )
					expect( res.getvalue(0,5).gsub(" ","") ).to eq( "[1,\"a\",null]" )
					expect( res.getvalue(0,6).gsub(" ","") ).to eq( "{\"b\":[2,3]}" )
				end
			end
		end

		context "with usage of result oids for copy encoder selection" do
			it "can type cast #copy_data input with explicit encoder" 

				res = @conn.exec( "SELECT * FROM copytable" )
				expect( res.values ).to eq( [['a', '123', '{5,4,3}'], ['b', '234', '{2,3}']] )
			end
		end
	end
end

