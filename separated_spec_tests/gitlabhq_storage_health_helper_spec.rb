require 'spec_helper'

describe StorageHealthHelper do
  describe '#failing_storage_health_message' do
    let(:health) do
      Gitlab::Git::Storage::Health.new(
        "<script>alert('storage name');)</script>",
        []
      )
    end

    it 'escapes storage names' 

  end
end

