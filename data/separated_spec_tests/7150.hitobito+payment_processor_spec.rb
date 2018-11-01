require 'spec_helper'

describe Invoice::PaymentProcessor do

  let(:invoice)        { invoices(:sent) }
  let(:invoice_config) { invoice.invoice_config }

  it 'parses 5 debit statements' 


  it 'builds payments for each debit statement' 


  it 'first payment is marked as valid' 


  it 'creates payment and marks invoice as payed' 


  it 'invalid payments only produce set alert' 


  it 'invalid and valid payments set alert and notice' 


  private

  def parser(file = 'camt.054-ESR-ASR_T_CH0209000000857876452_378159670_0_2018031411011923')
    @parser ||= Invoice::PaymentProcessor.new(read(file))
  end

  def read(name)
    Rails.root.join("spec/fixtures/invoices/#{name}.xml").read
  end

end

