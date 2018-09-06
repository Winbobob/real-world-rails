# encoding: utf-8

require 'carto/db/sql_interface'
require_relative '../../../spec_helper'

module Carto
  module Db
    describe SqlInterface do
      shared_examples 'run examples' do
        it 'should work with run' 


        it 'should raise an exception with run' 

      end

      shared_examples 'fetch examples' do
        it 'should work with fetch/block' 


        it 'should work with fetch/noblock' 


        it 'should raise an exception with fetch/block' 


        it 'should raise an exception with fetch/noblock' 

      end

      context 'with sequel connection' do
        before do
          options = ::SequelRails.configuration.environment_for(Rails.env)
          @connection = ::Sequel.connect(options)
        end

        after do
          @connection.disconnect
        end

        include_examples 'run examples'
        include_examples 'fetch examples'
      end

      context 'with active record connection' do
        before do
          @connection = ::ActiveRecord::Base.connection
        end

        include_examples 'run examples'
        include_examples 'fetch examples'
      end
    end
  end
end

