# encoding: utf-8
require 'rails_helper'
require_dependency 'sql_builder'

describe SqlBuilder do

  describe "attached" do
    before do
      @builder = Post.sql_builder("select * from posts /*where*/ /*limit*/")
    end

    it "should find a post by id" 

  end

  describe "map_exec" do
    class SqlBuilder::TestClass
      attr_accessor :int, :string, :date, :text, :bool
    end

    it "correctly maps to a klass" 

  end

  describe "detached" do
    before do
      @builder = SqlBuilder.new("select * from (select :a A union all select :b) as X /*where*/ /*order_by*/ /*limit*/ /*offset*/")
    end

    it "should allow for 1 param exec" 


    it "should allow for a single where" 


    it "should allow where chaining" 


    it "should allow order by" 

    it "should allow offset" 

  end

end

