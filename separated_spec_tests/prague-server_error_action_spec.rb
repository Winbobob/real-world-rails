require 'spec_helper'

describe ErrorAction do
  let(:charge) { create(:charge, paid: true) }
  let(:exception) { Stripe::CardError.new('Lorem', {}, {}) }
  let(:error) { ErrorAction.new(charge, exception, 'Test') }

  it 'returns TRUE' 


  it 'sets charge.paid to false' 


  it 'creates a new log entry with correct message' 

end

