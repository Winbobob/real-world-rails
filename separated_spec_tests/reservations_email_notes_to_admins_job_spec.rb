# frozen_string_literal: true
require 'spec_helper'

describe EmailNotesToAdminsJob, type: :job do
  def stub_scope_chain(res, *chain)
    final = chain.pop
    chain.each do |scope|
      allow(Reservation).to receive(scope).and_return(Reservation)
    end
    allow(Reservation).to receive(final).and_return(res)
  end

  shared_examples 'admin email' do |scope|
    it 'sends emails' 

    it 'gets the appropriate reservations' 

    it 'unsets the notes_unsent flag' 

  end

  it_behaves_like 'admin email', :checked_out
  it_behaves_like 'admin email', :returned
end

