require 'rails_helper'
describe API::SearchController do

  let(:user)    { create :user }
  let(:group)   { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:comment) { create :comment, discussion: discussion }

  describe 'index' do
    before do
      group.admins << user
      sign_in user
    end

    it 'does not find irrelevant threads' 


    it "can find a discussion by title" 


    # TODO: Pull this stuff out so it's not so magic number-y
    it "decays relevance for older posts" 


    it "can find a discussion by description" 


    it "can find a discussion by comment body" 


    it "does not display content the user does not have access to" 

  end
end

def fields_for(json, name, field)
  return [] unless json[name]
  json[name].map { |f| f[field] }
end

def search_for(term)
  get :index, params: { q: term }, format: :json
  JSON.parse(response.body).tap do |json|
    expect(json.keys).to include *(%w[search_results])
    @result_keys = fields_for(json, 'search_results', 'key')
    @ranks      = fields_for(json, 'search_results', 'rank').map { |d| d.to_f.round(2) }
  end
end

