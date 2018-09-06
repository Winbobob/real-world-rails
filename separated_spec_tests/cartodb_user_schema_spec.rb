# encoding: utf-8

require_relative '../../../spec_helper_min.rb'
require 'carto/db/user_schema'

module Carto
  module Db
    describe UserSchema do
      before(:all) do
        @user = ::User[FactoryGirl.create(:carto_user).id]

        @user_schema = Carto::Db::UserSchema.new(@user)
      end

      before(:each) do
        bypass_named_maps
      end

      after(:all) do
        @user.destroy
      end

      def run_in_user_database(query)
        @user.in_database.run(query)
      end

      describe '#table_names' do
        it 'Regression for CDB-3446' 


        it 'should find unused names' 

      end
    end
  end
end

