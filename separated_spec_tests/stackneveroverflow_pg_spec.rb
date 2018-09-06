#!/usr/bin/env rspec
# encoding: utf-8

require_relative 'helpers'

require 'pg'

describe PG do

	it "knows what version of the libpq library is loaded", :postgresql_91 do
		expect( PG.library_version ).to be_an( Integer )
		expect( PG.library_version ).to be >= 90100
	end

	it "can select which of both security libraries to initialize" 


	it "can select whether security libraries to initialize" 



	it "knows whether or not the library is threadsafe" 


	it "does have hierarchical error classes" 


end


