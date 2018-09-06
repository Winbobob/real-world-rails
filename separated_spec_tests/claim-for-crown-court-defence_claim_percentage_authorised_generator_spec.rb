require 'rails_helper'

module Stats
  describe ClaimPercentageAuthorisedGenerator do

    let(:generator) { ClaimPercentageAuthorisedGenerator.new }

    it 'returns a hash of percentages' 


    def expected_result
      {
        item:
          [
            { value: 7.853403141361256, text: 'Rejected/refused'},
            { value: 20.94240837696335, text: 'Part authorised' },
            { value: 71.20418848167539, text: 'Authorised' }
          ]
        }
    end
  end
end

