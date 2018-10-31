require 'spec_helper'

describe GroupChildEntity do
  include Gitlab::Routing.url_helpers

  let(:user) { create(:user) }
  let(:request) { double('request') }
  let(:entity) { described_class.new(object, request: request) }
  subject(:json) { entity.as_json }

  before do
    allow(request).to receive(:current_user).and_return(user)
  end

  shared_examples 'group child json' do
    it 'renders json' 


    %w[id
       full_name
       avatar_url
       name
       description
       markdown_description
       visibility
       type
       can_edit
       visibility
       permission
       relative_path].each do |attribute|
      it "includes #{attribute}" 

    end
  end

  describe 'for a project' do
    let(:object) do
      create(:project, :with_avatar,
             description: 'Awesomeness')
    end

    before do
      object.add_maintainer(user)
    end

    it 'has the correct type' 


    it 'includes the star count' 


    it 'has the correct edit path' 


    it_behaves_like 'group child json'
  end

  describe 'for a group', :nested_groups do
    let(:description) { 'Awesomeness' }
    let(:object) do
      create(:group, :nested, :with_avatar,
             description: description)
    end

    before do
      object.add_owner(user)
    end

    it 'has the correct type' 


    it 'counts projects and subgroups as children' 


    %w[children_count leave_path parent_id number_projects_with_delimiter number_users_with_delimiter project_count subgroup_count].each do |attribute|
      it "includes #{attribute}" 

    end

    it 'allows an owner to leave when there is another one' 


    it 'has the correct edit path' 


    context 'emoji in description' do
      let(:description) { ':smile:' }

      it 'has the correct markdown_description' 

    end

    it_behaves_like 'group child json'
  end
end

