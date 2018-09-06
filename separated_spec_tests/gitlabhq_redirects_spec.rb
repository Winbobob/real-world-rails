require 'spec_helper'

describe 'Projects > Show > Redirects' do
  let(:user) { create :user }
  let(:public_project) { create :project, :public }
  let(:private_project) { create :project, :private }

  before do
    allow(Gitlab.config.gitlab).to receive(:host).and_return('www.example.com')
  end

  it 'shows public project page' 


  it 'redirects to sign in page when project is private' 


  it 'redirects to sign in page when project does not exist' 


  it 'redirects to public project page after signing in' 


  it 'redirects to private project page after sign in' 


  context 'when signed in' do
    before do
      sign_in(user)
    end

    it 'returns 404 status when project does not exist' 


    it 'returns 404 when project is private' 

  end
end

