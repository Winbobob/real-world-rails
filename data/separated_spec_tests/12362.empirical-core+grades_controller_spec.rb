require 'rails_helper'

describe GradesController do
  let(:teacher) { create(:teacher) }

  before do
    session[:user_id] = teacher.id
  end

  it { should use_before_action :authorize! }

  describe '#index' do
    it 'should render the correct json' 

  end

  describe '#tooltip' do
    before do
      allow(ActiveRecord::Base.connection).to receive(:execute) { ["query result"] }
    end

    it 'should render the correct json' 

  end
end

