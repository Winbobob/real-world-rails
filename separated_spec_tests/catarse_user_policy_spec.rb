# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  subject { UserPolicy }

  let(:user) { create(:user) }
  shared_examples_for 'update permissions only admin' do
    it 'should deny access if user is nil' 


    it 'should deny access if user is not updating himself' 


    it 'should permit access if user is updating himself' 


    it 'should permit access if user is admin' 

  end

  shared_examples_for 'update permissions' do
    it 'should deny access if user is nil' 


    it 'should deny access if user is not updating himself' 


    it 'should permit access if user is updating himself' 


    it 'should permit access if user is admin' 

  end

  permissions(:show?) do
    it { is_expected.to permit(nil, user) }
  end

  permissions(:ban?) { it_should_behave_like 'update permissions only admin' }

  permissions(:update?) { it_should_behave_like 'update permissions' }

  permissions(:settings?) { it_should_behave_like 'update permissions' }

  permissions(:billing?) { it_should_behave_like 'update permissions' }

  permissions(:destroy?) { it_should_behave_like 'update permissions' }

  permissions(:credits?) { it_should_behave_like 'update permissions' }

  permissions(:unsubscribe_notifications?) { it_should_behave_like 'update permissions' }
end

