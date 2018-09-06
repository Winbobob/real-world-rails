require "spec_helper"

ActiveRecord::Schema.define do
  create_table :refinery_crud_dummies, force: true do |t|
    t.integer :parent_id
    t.integer :lft
    t.integer :rgt
    t.integer :depth
  end
end

module Refinery
  class CrudDummy < ActiveRecord::Base
    acts_as_nested_set
  end

  class CrudDummyController < ::ApplicationController
    crudify :'refinery/crud_dummy'
  end
end

module Refinery
  describe CrudDummyController, type: :controller do
    before do
      @routes = ActionDispatch::Routing::RouteSet.new.tap do |r|
        r.draw do
          namespace :refinery do
            resources :crud_dummy, except: :show do
              post :update_positions, on: :collection
            end
          end
        end
      end
    end

    describe "#update_positions" do
      context "with existing dummies" do
        let!(:crud_dummy_one) { Refinery::CrudDummy.create! }
        let!(:crud_dummy_two) { Refinery::CrudDummy.create! }
        let!(:crud_dummy_three) { Refinery::CrudDummy.create! }

        it "orders dummies" 


        it "orders nested dummies" 

      end

      # Regression test for https://github.com/refinery/refinerycms/issues/1585
      it "sorts numerically rather than by string key" 

    end

  end
end

