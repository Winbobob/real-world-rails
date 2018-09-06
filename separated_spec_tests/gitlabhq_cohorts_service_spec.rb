require 'spec_helper'

describe CohortsService do
  describe '#execute' do
    def month_start(months_ago)
      months_ago.months.ago.beginning_of_month.to_date
    end

    # In the interests of speed and clarity, this example has minimal data.
    it 'returns a list of user cohorts' 

  end
end

