require './lib/aircasting/deep_symbolize'
require 'active_support/core_ext'

include AirCasting

describe DeepSymbolize do
	describe ".deep_symbolize" do
		let(:data) do 
			{
				"some" => "data", 
				"nested" => {
					"nested_key" => "nested_val",
					"nested_hash" => {
						"deep_key" => "deep_value"
					},
					"array" => [
						{
							"key" => "val"
						}
					]
				}
			}
		end

		subject { Object.new.extend(DeepSymbolize).deep_symbolize(data) }

		it "should symbolize keys" 


		it "should symbolize keys in nested hashes" 


		it "should symbolize keys in deeply nested hashes" 


		it "should symbolize arrays" 

	end
end

