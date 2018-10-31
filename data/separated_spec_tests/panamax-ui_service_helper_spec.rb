require 'spec_helper'

describe ServiceHelper do
  describe '#linkable_service_options' do
    let(:services) do
      [
        double(:service_1, id: 1, name: 'first'),
        double(:service_2, id: 2, name: 'second')
      ]
    end

    it 'returns a structure to be passed to a select' 


    it 'filters out the current service' 

  end
end

