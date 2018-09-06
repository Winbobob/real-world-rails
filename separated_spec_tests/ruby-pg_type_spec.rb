# -*- rspec -*-
# encoding: utf-8

require 'pg'


describe "PG::Type derivations" do
	let!(:textenc_int) { PG::TextEncoder::Integer.new name: 'Integer', oid: 23 }
	let!(:textdec_int) { PG::TextDecoder::Integer.new name: 'Integer', oid: 23 }
	let!(:textenc_boolean) { PG::TextEncoder::Boolean.new }
	let!(:textdec_boolean) { PG::TextDecoder::Boolean.new }
	let!(:textenc_float) { PG::TextEncoder::Float.new }
	let!(:textdec_float) { PG::TextDecoder::Float.new }
	let!(:textenc_string) { PG::TextEncoder::String.new }
	let!(:textdec_string) { PG::TextDecoder::String.new }
	let!(:textenc_timestamp) { PG::TextEncoder::TimestampWithoutTimeZone.new }
	let!(:textdec_timestamp) { PG::TextDecoder::TimestampWithoutTimeZone.new }
	let!(:textenc_timestamptz) { PG::TextEncoder::TimestampWithTimeZone.new }
	let!(:textdec_timestamptz) { PG::TextDecoder::TimestampWithTimeZone.new }
	let!(:textenc_bytea) { PG::TextEncoder::Bytea.new }
	let!(:textdec_bytea) { PG::TextDecoder::Bytea.new }
	let!(:binaryenc_int2) { PG::BinaryEncoder::Int2.new }
	let!(:binaryenc_int4) { PG::BinaryEncoder::Int4.new }
	let!(:binaryenc_int8) { PG::BinaryEncoder::Int8.new }
	let!(:binarydec_integer) { PG::BinaryDecoder::Integer.new }

	let!(:intenc_incrementer) do
		Class.new(PG::SimpleEncoder) do
			def encode(value)
				(value.to_i + 1).to_s + " "
			end
		end.new
	end
	let!(:intdec_incrementer) do
		Class.new(PG::SimpleDecoder) do
			def decode(string, tuple=nil, field=nil)
				string.to_i+1
			end
		end.new
	end

	let!(:intenc_incrementer_with_encoding) do
		Class.new(PG::SimpleEncoder) do
			def encode(value, encoding)
				r = (value.to_i + 1).to_s + " #{encoding}"
				r.encode!(encoding)
			end
		end.new
	end
	let!(:intenc_incrementer_with_int_result) do
		Class.new(PG::SimpleEncoder) do
			def encode(value)
				value.to_i+1
			end
		end.new
	end

	it "shouldn't be possible to build a PG::Type directly" 


	describe PG::SimpleCoder do
		describe '#decode' do
			it "should offer decode method with tuple/field" 


			it "should offer decode method without tuple/field" 


			it "should decode with ruby decoder" 


			it "should decode integers of different lengths from text format" 

				66.times do |bits|
					expect( textdec_int.decode((2 ** bits).to_s) ).to eq( 2 ** bits )
					expect( textdec_int.decode((2 ** bits - 1).to_s) ).to eq( 2 ** bits - 1 )
					expect( textdec_int.decode((-2 ** bits).to_s) ).to eq( -2 ** bits )
					expect( textdec_int.decode((-2 ** bits + 1).to_s) ).to eq( -2 ** bits + 1 )
				end
			end

			it 'decodes bytea to a binary string' 


			context 'timestamps' do
				it 'decodes timestamps without timezone' 

				it 'decodes timestamps with hour timezone' 

				it 'decodes timestamps with hour:minute timezone' 

				it 'decodes timestamps with hour:minute:sec timezone' 

				it 'decodes timestamps with date before 1823' 

				it 'decodes timestamps with date after 2116' 

				it 'decodes timestamps with variable number of digits for the useconds part' 

				end
				it 'decodes timestamps with leap-second' 


				def textdec_timestamptz_decode_should_fail(str)
					expect(textdec_timestamptz.decode(str)).to eq(str)
				end

				it 'fails when the timestamp is an empty string' 

				it 'fails when the timestamp contains values with less digits than expected' 

				it 'fails when the timestamp contains values with more digits than expected' 

				it 'fails when the timestamp contains values with invalid characters' 

				end
				it 'fails when the timestamp contains leading characters' 

				it 'fails when the timestamp contains trailing characters' 

				it 'fails when the timestamp contains non ASCII character' 

			end

			context 'identifier quotation' do
				it 'should build an array out of an quoted identifier string' 


				it 'should split unquoted identifier string' 


				it 'should split identifier string with correct character encoding' 

			end

			it "should raise when decode method is called with wrong args" 


			it "should pass through nil values" 

		end

		describe '#encode' do
			it "should offer encode method for text type" 


			it "should offer encode method for binary type" 


			it "should encode integers from string to binary format" 


			it "should encode integers of different lengths to text format" 

				66.times do |bits|
					expect( textenc_int.encode(2 ** bits) ).to eq( (2 ** bits).to_s )
					expect( textenc_int.encode(2 ** bits - 1) ).to eq( (2 ** bits - 1).to_s )
					expect( textenc_int.encode(-2 ** bits) ).to eq( (-2 ** bits).to_s )
					expect( textenc_int.encode(-2 ** bits + 1) ).to eq( (-2 ** bits + 1).to_s )
				end
			end

			it "should encode integers from string to text format" 


			it "should encode boolean values" 

			end

			it "should encode special floats equally to Float#to_s" 


			it "encodes binary string to bytea" 


			context 'identifier quotation' do
				it 'should quote and escape identifier' 


				it 'should quote identifiers with correct character encoding' 


				it "will raise a TypeError for invalid arguments to quote_ident" 

			end

			it "should encode with ruby encoder" 


			it "should encode with ruby encoder and given character encoding" 


			it "should return when ruby encoder returns non string values" 


			it "should pass through nil values" 

		end

		it "should be possible to marshal encoders" 


		it "should be possible to marshal decoders" 


		it "should respond to to_h" 


		it "should have reasonable default values" 

	end

	describe PG::CompositeCoder do
		describe "Array types" do
			let!(:textenc_string_array) { PG::TextEncoder::Array.new elements_type: textenc_string }
			let!(:textdec_string_array) { PG::TextDecoder::Array.new elements_type: textdec_string }
			let!(:textenc_int_array) { PG::TextEncoder::Array.new elements_type: textenc_int, needs_quotation: false }
			let!(:textdec_int_array) { PG::TextDecoder::Array.new elements_type: textdec_int, needs_quotation: false }
			let!(:textenc_float_array) { PG::TextEncoder::Array.new elements_type: textenc_float, needs_quotation: false }
			let!(:textdec_float_array) { PG::TextDecoder::Array.new elements_type: textdec_float, needs_quotation: false }
			let!(:textenc_timestamp_array) { PG::TextEncoder::Array.new elements_type: textenc_timestamp, needs_quotation: false }
			let!(:textdec_timestamp_array) { PG::TextDecoder::Array.new elements_type: textdec_timestamp, needs_quotation: false }
			let!(:textenc_string_array_with_delimiter) { PG::TextEncoder::Array.new elements_type: textenc_string, delimiter: ';' }
			let!(:textdec_string_array_with_delimiter) { PG::TextDecoder::Array.new elements_type: textdec_string, delimiter: ';' }
			let!(:textdec_bytea_array) { PG::TextDecoder::Array.new elements_type: textdec_bytea }

			#
			# Array parser specs are thankfully borrowed from here:
			# https://github.com/dockyard/pg_array_parser
			#
			describe '#decode' do
				context 'one dimensional arrays' do
					context 'empty' do
						it 'returns an empty array' 

					end

					context 'no strings' do
						it 'returns an array of strings' 

					end

					context 'NULL values' do
						it 'returns an array of strings, with nils replacing NULL characters' 

					end

					context 'quoted NULL' do
						it 'returns an array with the word NULL' 

					end

					context 'strings' do
						it 'returns an array of strings when containing commas in a quoted string' 


						it 'returns an array of strings when containing an escaped quote' 


						it 'returns an array of strings when containing an escaped backslash' 


						it 'returns an array containing empty strings' 


						it 'returns an array containing unicode strings' 


						it 'respects a different delimiter' 


						it 'ignores array dimensions' 


						it 'complains about broken array dimensions' 

					end

					context 'bytea' do
						it 'returns an array of binary strings' 

					end

				end

				context 'two dimensional arrays' do
					context 'empty' do
						it 'returns an empty array' 

					end
					context 'no strings' do
						it 'returns an array of strings with a sub array' 

					end
					context 'strings' do
						it 'returns an array of strings with a sub array' 

						it 'returns an array of strings with a sub array and a quoted }' 

						it 'returns an array of strings with a sub array and a quoted {' 

						it 'returns an array of strings with a sub array and a quoted { and escaped quote' 

						it 'returns an array of strings with a sub array with empty strings' 

					end
					context 'timestamps' do
						it 'decodes an array of timestamps with sub arrays' 

					end
				end
				context 'three dimensional arrays' do
					context 'empty' do
						it 'returns an empty array' 

					end
					it 'returns an array of strings with sub arrays' 

				end

				it 'should decode array of types with decoder in ruby space' 


				it 'should decode array of nil types' 

			end

			describe '#encode' do
				context 'three dimensional arrays' do
					it 'encodes an array of strings and numbers with sub arrays' 

					it 'encodes an array of strings with quotes' 

					it 'encodes an array of int8 with sub arrays' 

					it 'encodes an array of int8 with strings' 

					it 'encodes an array of float8 with sub arrays' 

				end
				context 'two dimensional arrays' do
					it 'encodes an array of timestamps with sub arrays' 

				end
				context 'one dimensional array' do
					it 'can encode empty arrays' 

					it 'encodes an array of NULL strings w/wo quotes' 

					it 'respects a different delimiter' 

				end

				context 'array of types with encoder in ruby space' do
					it 'encodes with quotation and default character encoding' 


					it 'encodes with quotation and given character encoding' 


					it 'encodes without quotation' 


					it 'encodes with default character encoding' 


					it 'encodes with given character encoding' 


					it "should raise when ruby encoder returns non string values" 

				end

				it "should pass through non Array inputs" 


				context 'literal quotation' do
					it 'should quote and escape literals' 


					it 'should quote literals with correct character encoding' 

				end
			end

			it "should be possible to marshal encoders" 


			it "should be possible to marshal encoders" 


			it "should respond to to_h" 


			it "shouldn't accept invalid elements_types" 


			it "should have reasonable default values" 

		end

		it "should encode Strings as base64 in TextEncoder" 


		it 'should encode Strings as base64 with correct character encoding' 


		it "should encode Strings as base64 in BinaryDecoder" 


		it "should encode Integers as base64" 


		it "should decode base64 to Strings in TextDecoder" 


		it "should decode base64 in BinaryEncoder" 


		it "should decode base64 to Integers" 


		it "should decode base64 with garbage" 

	end

	describe PG::CopyCoder do
		describe PG::TextEncoder::CopyRow do
			context "with default typemap" do
				let!(:encoder) do
					PG::TextEncoder::CopyRow.new
				end

				it "should encode different types of Ruby objects" 


				it 'should output a string with correct character encoding' 

			end

			context "with TypeMapByClass" do
				let!(:tm) do
					tm = PG::TypeMapByClass.new
					tm[Integer] = textenc_int
					tm[Float] = intenc_incrementer
					tm[Array] = PG::TextEncoder::Array.new elements_type: textenc_string
					tm
				end
				let!(:encoder) do
					PG::TextEncoder::CopyRow.new type_map: tm
				end

				it "should have reasonable default values" 


				it "copies all attributes with #dup" 


				describe '#encode' do
					it "should encode different types of Ruby objects" 


					it "should escape special characters" 


					it "should escape with different delimiter" 

				end
			end
		end

		describe PG::TextDecoder::CopyRow do
			context "with default typemap" do
				let!(:decoder) do
					PG::TextDecoder::CopyRow.new
				end

				describe '#decode' do
					it "should decode different types of Ruby objects" 


					it 'should respect input character encoding' 

				end
			end

			context "with TypeMapByColumn" do
				let!(:tm) do
					PG::TypeMapByColumn.new [textdec_int, textdec_string, intdec_incrementer, nil]
				end
				let!(:decoder) do
					PG::TextDecoder::CopyRow.new type_map: tm
				end

				describe '#decode' do
					it "should decode different types of Ruby objects" 

				end
			end
		end
	end
end

