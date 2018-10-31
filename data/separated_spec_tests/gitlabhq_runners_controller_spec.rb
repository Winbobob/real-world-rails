require 'spec_helper'

describe Admin::RunnersController do
  let(:runner) { create(:ci_runner) }

  before do
    sign_in(create(:admin))
  end

  describe '#index' do
    it 'lists all runners' 

  end

  describe '#show' do
    it 'shows a particular runner' 


    it 'shows 404 for unknown runner' 

  end

  describe '#update' do
    it 'updates the runner and ticks the queue' 

  end

  describe '#destroy' do
    it 'destroys the runner' 

  end

  describe '#resume' do
    it 'marks the runner as active and ticks the queue' 

  end

  describe '#pause' do
    it 'marks the runner as inactive and ticks the queue' 

  end
end

