# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe HealthChecks::HealthCheckable do

  before(:each) do
    class MockCheck
      include HealthChecks::HealthCheckable
    end
    @subject = MockCheck.new
  end

  describe '#initialize' do

    it 'allows a custom failure message to be set' 


    it 'allows a custom success message to be set' 


  end

  describe '#name' do

    it 'returns the name of the check' 


  end

  describe '#ok?' do

    it 'is intended to be overridden by the includer' 


  end

  describe '#failure_message' do

    it 'returns a default message if one has not been set' 


  end

  describe '#failure_message=' do

    it 'allows a custom failure message to be set' 


  end

  describe '#success_message' do

    it 'returns a default message if one has not been set' 


  end

  describe '#success_message=' do

    it 'allows a custom success message to be set' 


  end

  describe '#message' do

    context 'if the check succeeds' do

      before(:each) do
        allow(@subject).to receive_messages(:ok? => true)
      end

      it 'returns the default success message' 


      it 'returns a custom success message if one has been set' 


    end

    context 'if the check fails' do

      before(:each) do
        allow(@subject).to receive_messages(:ok? => false)
      end

      it 'returns the default failure message' 


      it 'returns a custom failure message if one has been set' 


    end

  end

end

