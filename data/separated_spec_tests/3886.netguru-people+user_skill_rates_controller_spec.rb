require 'spec_helper'

describe Users::UserSkillRatesController do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe '#history' do
    subject { get :history, id: user.id }

    let(:skill_category) { create(:skill_category) }

    it { expect(subject).to render_template(:history) }

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes user and skill categories' 

  end
end

