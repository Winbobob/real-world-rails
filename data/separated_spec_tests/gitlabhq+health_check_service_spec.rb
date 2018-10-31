require 'spec_helper'

describe Gitlab::GitalyClient::HealthCheckService do
  let(:project) { create(:project) }
  let(:storage_name) { project.repository_storage }

  subject { described_class.new(storage_name) }

  describe '#check' do
    it 'successfully sends a health check request' 


    it 'receives an unsuccessful health check request' 


    it 'gracefully handles gRPC error' 

  end
end

