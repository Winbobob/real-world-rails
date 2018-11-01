require 'spec_helper'

describe Gitlab::GitalyClient::NotificationService do
  describe '#post_receive' do
    let(:project) { create(:project) }
    let(:storage_name) { project.repository_storage }
    let(:relative_path) { project.disk_path + '.git' }
    subject { described_class.new(project.repository) }

    it 'sends a post_receive message' 

  end
end

