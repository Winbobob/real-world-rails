require 'spec_helper'
require 'carto_gears_api/queue/jobs_service'
require 'carto_gears_api/queue/generic_job'
require 'carto_gears_api/test_mail'

describe CartoGearsApi::Queue::JobsService do
  let(:service) { CartoGearsApi::Queue::JobsService.new }

  module Resque; end

  describe '#send_job' do
    it 'enqueues a Resque::CartoGearsJobs::GenericJob#perform with the class, method and random parameters' 

  end
end

