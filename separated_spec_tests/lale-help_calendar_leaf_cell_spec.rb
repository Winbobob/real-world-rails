require 'rails_helper'

RSpec.describe CalendarLeafCell, type: :cell do

  include RSpecHtmlMatchers

  context 'cell rendering' do
    
    let(:date) { Date.parse("2016-12-24") }

    context "without options" do
      let(:html) { cell(:calendar_leaf, date).call }

      it "renders month" 


      it "renders week" 

      
      it "renders weekday" 

    end

    context "with options" do
      let(:html) { cell(:calendar_leaf, date, class: 'task-date', data: {foo: 'bar'}).call.to_s }
      it "passes them through as attributes on the outer tag" 

    end

    context "with icon" do
      let(:html) { cell(:calendar_leaf, date, with_icon: :project).call }

      it "renders icon" 

    end
  end

end

