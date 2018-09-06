require 'rails_helper'

describe 'Private Working Groups', js: true do
  let(:circle) { create(:circle) }
  let!(:circle_admin_role) { create :circle_role_admin, circle: circle }
  let(:user_1) { create(:user, primary_circle: circle) }
  let(:user_2) { create(:user, primary_circle: circle) }

  let(:public_group)  { create(:working_group, is_private: false, circle: circle) }
  let(:private_group) { create(:working_group, is_private: true , circle: circle) }

  before do
    create(:circle_role_volunteer, circle: circle, user: user_1)
    create(:circle_role_volunteer, circle: circle, user: user_2)

    public_group.roles.member.create(user: user_1)
    public_group.roles.member.create(user: user_2)

    private_group.roles.member.create(user: user_1)
  end

  it "is setup" 



  context "as private group member" do
    it "lets them see the working group" 

  end


  context "not as private group member" do
    it "lets them see only the public working group" 

  end
end

