# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'Requesting changes to a public body' do

  describe 'reporting an out of date email address' do

    let(:public_body) { FactoryBot.create(:public_body) }
    let(:user) { FactoryBot.create(:user) }

    describe 'when not logged in' do

      it "should not forget which public body you are updating during login" 


    end
  end
end

