# frozen_string_literal: true
require 'spec_helper'

describe ProjectServiceWorker, '#perform' do
  let(:worker) { described_class.new }
  let(:service) { JiraService.new }

  before do
    allow(Service).to receive(:find).and_return(service)
  end

  it 'executes service with given data' 


  it 'logs error messages' 

end

