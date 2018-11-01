# frozen_string_literal: true

require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180831164910_import_common_metrics.rb')

describe ImportCommonMetrics, :migration do
  describe '#up' do
    it "imports all prometheus metrics" 

  end
end

