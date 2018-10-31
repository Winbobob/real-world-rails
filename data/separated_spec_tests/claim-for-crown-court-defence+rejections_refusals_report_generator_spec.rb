require 'rails_helper'

RSpec.describe Stats::RejectionsRefusalsReportGenerator, type: :service do
  describe '.call' do
    let(:mocked_data) {
      [
        { provider_name: 'Provider Foo', provider_type: 'firm', supplier_number: '2A333Z', claims_issued: 23, rejections: 2, rejections_percent: 0.08, refusals: 17, refusals_percent: 0.74, rejections_refusals_percent: 0.87 },
        { provider_name: 'Provider Foo', provider_type: 'firm', supplier_number: '2A444B', claims_issued: 45, rejections: 10, rejections_percent: 0.045, refusals: 22, refusals_percent: 0.49, rejections_refusals_percent: 0.71 },
        { provider_name: 'Provider Foo', provider_type: 'chamber', supplier_number: '2A555G', claims_issued: 102, rejections: 24, rejections_percent: 0.24, refusals: 40, refusals_percent: 0.39, rejections_refusals_percent: 0.63 },
        { provider_name: 'Provider Bar', provider_type: 'firm', supplier_number: '2A999Z', claims_issued: 76, rejections: 7, rejections_percent: 0.09, refusals: 31, refusals_percent: 0.41, rejections_refusals_percent: 0.5 }
      ]
    }

    it 'exports the retrieved data' 

  end
end

