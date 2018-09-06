require 'spec_helper'

describe SearchHelper do
  # Override simple_sanitize for our testing purposes
  def simple_sanitize(str)
    str
  end

  describe 'search_autocomplete_source' do
    context "with no current user" do
      before do
        allow(self).to receive(:current_user).and_return(nil)
      end

      it "it returns nil" 

    end

    context "with a standard user" do
      let(:user)   { create(:user) }

      before do
        allow(self).to receive(:current_user).and_return(user)
      end

      it "includes Help sections" 


      it "includes default sections" 


      it "does not include admin sections" 


      it "does not allow regular expression in search term" 


      it "includes the user's groups" 


      it "includes nested group" 


      it "includes the user's projects" 


      it "does not include the public group" 


      context "with a current project" do
        before do
          @project = create(:project, :repository)
        end

        it "includes project-specific sections" 

      end
    end

    context 'with an admin user' do
      let(:admin) { create(:admin) }

      before do
        allow(self).to receive(:current_user).and_return(admin)
      end

      it "includes admin sections" 

    end
  end

  describe 'search_filter_input_options' do
    context 'project' do
      before do
        @project = create(:project, :repository)
      end

      it 'includes id with type' 


      it 'includes project-id' 


      it 'includes project base-endpoint' 


      it 'includes autocomplete=off flag' 

    end

    context 'group' do
      before do
        @group = create(:group, name: 'group')
      end

      it 'does not includes project-id' 


      it 'includes group base-endpoint' 

    end
  end
end

