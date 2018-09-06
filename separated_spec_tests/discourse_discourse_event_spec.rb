require 'rails_helper'
require_dependency 'discourse_event'

describe DiscourseEvent do

  describe "#events" do
    it "defaults to {}" 


    describe "key value" do
      it "defaults to an empty set" 

    end
  end

  context 'when calling events' do

    let(:harvey) {
      OpenStruct.new(
        name: 'Harvey Dent',
        job: 'District Attorney'
      )
    }

    before do
      DiscourseEvent.on(:acid_face) do |user|
        user.name = 'Two Face'
      end
    end

    context 'when event does not exist' do

      it "does not raise an error" 


    end

    context 'when single event exists' do

      it "doesn't raise an error" 


      it "changes the name" 


    end

    context 'when multiple events exist' do

      before do
        DiscourseEvent.on(:acid_face) do |user|
          user.job = 'Supervillian'
        end

        DiscourseEvent.trigger(:acid_face, harvey)
      end

      it 'triggers both events' 


    end

  end

end

