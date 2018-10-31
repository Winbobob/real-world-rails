require "rails_helper"

describe Positionable do

  def positions
    TestItem.order('position asc, id asc').pluck(:id)
  end

  context "move_to" do
    before do
      class TestItem < ActiveRecord::Base
        include Positionable
      end

      DB.exec("create temporary table test_items(id int primary key, position int)")
    end

    after do
      DB.exec("drop table test_items")

      # import is making my life hard, we need to nuke this out of orbit
      des = ActiveSupport::DescendantsTracker.class_variable_get :@@direct_descendants
      des[ActiveRecord::Base].delete(TestItem)
    end

    it "can position stuff correctly" 

  end
end

