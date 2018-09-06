require "spec_helper"

describe "Spatial manual entry", reset: false do
  before :all do
    load_page :search
  end
  
  context "Spatial" do
    before :each do
      load_page :search
    end

    context "point manual entry" do
      it "filters collections using the selected point" 


      it "displays point coordinates in the manual entry text box" 


      it "displays an error message when invalid coordinates are entered" 


      context 'setting a point' do
        before(:each) do
          manually_create_point(0, 0)
          wait_for_xhr
        end

        it 'sets a point at 0,0' 


        context 'and then changing the point' do
          before(:each) do
            manually_create_point(-75, 40)
            wait_for_xhr
          end

          it "updates the coordinates in the manual entry box" 


          it "updates the collection filters using the new point selection" 

        end
      end

      context "removing the point selection" do
        before(:each) do
          manually_create_point(0, 0)
          wait_for_xhr
          clear_spatial
          wait_for_xhr
        end

        it "removes the spatial point in the manual entry box" 


        it "removes the spatial point collection filter" 

      end
    end

    context "bounding box manual entry" do
      it "filters collections using the selected bounding box" 


      it "displays bounding box points in the manual entry text boxes" 


      it "displays an error message when invalid coordinates are entered" 


      context "changing the bounding box selection" do
        before(:each) do
          manually_create_bounding_box(0, 0, 10, 10)
          wait_for_xhr
          manually_create_bounding_box(69, -174, 72, -171)
          wait_for_xhr
        end

        it "updates the coordinates in the manual entry text boxes" 


        it "updates the collection filters using the new bounding box selection" 

      end

      context "removing the bounding box selection" do
        before(:each) do
          manually_create_bounding_box(0, 0, 10, 10)
          wait_for_xhr
          clear_spatial
          wait_for_xhr
        end

        it "removes the spatial point in the manual entry text boxes" 


        it "removes the spatial bounding box collection filter" 


        context "then draw another bounding box" do
          before :all do
            manually_create_bounding_box(0, 0, 5, 5)
            wait_for_xhr
          end

          it "sets coordinates in the manual entry boxes" 

        end
      end
    end
  end
end

