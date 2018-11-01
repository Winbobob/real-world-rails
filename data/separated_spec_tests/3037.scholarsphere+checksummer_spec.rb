# frozen_string_literal: true

require 'rails_helper'

describe Checksummer do
  let(:user) { create(:user) }
  let(:work) { create(:public_work_with_pdf, depositor: user.login) }
  let(:checksummer_with_work) { described_class.new(work) }
  let(:fedora_sha1_without_urn) { ['ad13c5e7cc6d8198f25e003bd2965b3544e52a32'] }

  before do
    allow(CharacterizeJob).to receive(:perform_later)
  end

  it 'can return the fedora derived checksum for the work' 


  it 'can return the checksum for works stored as external files' 

end

