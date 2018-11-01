require 'spec_helper'

describe Gitlab::CycleAnalytics::Updater do
  describe 'updates authors' do
    let(:user) { create(:user) }
    let(:events) { [{ 'author_id' => user.id }] }

    it 'maps the correct user' 

  end

  describe 'updates builds' do
    let(:build) { create(:ci_build) }
    let(:events) { [{ 'id' => build.id }] }

    it 'maps the correct build' 

  end
end

