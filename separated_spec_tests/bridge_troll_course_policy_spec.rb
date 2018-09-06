require 'rails_helper'

describe CoursePolicy do
  ['edit?', 'create?', 'new?', 'update?'].each do |func|
    describe "##{func}" do
      let!(:user) { create(:user) }
      let(:course) { create(:course) }
      it "is true if the logged in user is an admin" 


      it "is false for a normal user" 

    end
  end

  describe '#destroy?' do
    let!(:user) { create(:user) }
    let(:course) { create(:course) }

    context "when the course has not yet used for an event" do
      it "is true when user is admin" 


      it "is false for normal user" 

    end

    context "when the location was used for a event" do
      let!(:event) do
        create(:event, course: course).tap { |_| course.reload }
      end

      context "when the course has not yet used for an event" do
        it "is false when user is admin" 


        it "is false for normal user" 

      end
    end
  end
end

