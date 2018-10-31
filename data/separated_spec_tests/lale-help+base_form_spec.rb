require 'rails_helper'

describe Project::BaseForm do

  let(:ability) { Ability.new(user) }
  
  # user must be in the circle for things to work, so it's easiest to set this up by creating a role.
  let(:user_circle_role) { create(:circle_role_volunteer) }
  let(:user) { user_circle_role.user }
  let(:circle) { user_circle_role.circle }

  # these are the defaults, often overridden in contexts below.
  let(:params) { { user: user, circle: circle, ability: ability } }

  # object under test.
  let(:form) { Project::Create.new(params) }

  describe ".new" do
    describe "default attributes" do
      describe "project" do

        context "no project given" do
          it "builds a new project" 

        end

        context "project given" do
          let(:project) { create(:project) }
          let(:params) { { user: user, circle: circle, ability: ability, project: project } }
          it "uses that project" 

        end

      end 

      describe "organizer_id" do
        context "organizer_id given" do
          let(:organizer_id) { create(:user).id }
          let(:params) { { user: user, circle: circle, ability: ability, organizer_id: organizer_id } }
          it "uses it" 

        end

        context "no organizer_id given" do
          context "project has an admin" do
            let(:project_admin_role) { create(:project_admin_role) }
            let(:project_admin) { project_admin_role.user }
            let(:project) { project_admin_role.project }
            let(:params) { { user: project_admin, circle: circle, ability: ability, project: project } }

            it "uses the project admin" 

          end

          context "project has no admin" do
            it "organizer_id is nil" 

          end
        end
      end 
    end

    describe "available_working_groups" do
      context "circle has a working group" do
        let!(:wg) { create(:working_group, circle: circle)}
        before { allow(ability).to receive(:can?) { true } } # gnah
        it "is included" 

      end
      # TODO test contexts here
    end

    describe "available_working_groups_disabled?" do
      let(:params) { { user: user, circle: circle, ability: ability, project: project } }
      context 'new project' do
        let(:project) { build(:project) }
        it 'returns false' 

      end
      context 'existing project' do
        let(:project) { create(:project) }
        it 'returns true' 

      end
    end
  end

  describe "#submit" do
    let(:wg) { create(:working_group, circle: circle) }
    let(:name) { attributes_for(:project)[:name] }
    let(:params) { { user: user, circle: circle, ability: ability, working_group_id: wg.id, name: name, organizer_id: user.id, start_date: Date.today } }
    context "valid attributes given" do
      it "creates a project" 

    end

    context "no organizer_id given" do
      let(:params) { { user: user, circle: circle, ability: ability, working_group_id: wg.id, name: name } }
      it "has an error" 

    end

    context "no start_date given" do
      let(:params) { { user: user, circle: circle, ability: ability, working_group_id: wg.id, name: name, organizer_id: user.id } }
      it "has an error" 

    end
  end

end

