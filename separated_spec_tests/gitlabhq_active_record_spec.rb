require 'spec_helper'

describe Gitlab::Metrics::Subscribers::ActiveRecord do
  let(:env) { {} }
  let(:transaction) { Gitlab::Metrics::WebTransaction.new(env) }
  let(:subscriber)  { described_class.new }

  let(:event) do
    double(:event, duration: 2,
                   payload:  { sql: 'SELECT * FROM users WHERE id = 10' })
  end

  describe '#sql' do
    describe 'without a current transaction' do
      it 'simply returns' 

    end

    describe 'with a current transaction' do
      it 'observes sql_duration metric' 


      it 'increments the :sql_duration value' 

    end
  end
end

