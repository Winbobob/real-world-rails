require 'spec_helper'

describe Gitlab::Metrics::Prometheus, :prometheus do
  let(:all_metrics) { Gitlab::Metrics }
  let(:registry) { all_metrics.registry }

  describe '#reset_registry!' do
    it 'clears existing metrics' 

  end
end

