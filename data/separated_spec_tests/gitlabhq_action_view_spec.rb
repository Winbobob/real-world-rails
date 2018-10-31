require 'spec_helper'

describe Gitlab::Metrics::Subscribers::ActionView do
  let(:env) { {} }
  let(:transaction) { Gitlab::Metrics::WebTransaction.new(env) }

  let(:subscriber) { described_class.new }

  let(:event) do
    root = Rails.root.to_s

    double(:event, duration: 2.1,
                   payload:  { identifier: "#{root}/app/views/x.html.haml" })
  end

  before do
    allow(subscriber).to receive(:current_transaction).and_return(transaction)
  end

  describe '#render_template' do
    it 'tracks rendering of a template' 


    it 'observes view rendering time' 

  end
end

