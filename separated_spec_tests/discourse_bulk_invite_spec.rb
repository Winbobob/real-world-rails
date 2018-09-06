require 'rails_helper'

describe Jobs::BulkInvite do

  context '.execute' do

    it 'raises an error when the filename is missing' 


    context '.read_csv_file' do
      let(:user) { Fabricate(:user) }
      let(:bulk_invite) { Jobs::BulkInvite.new }
      let(:csv_file) { "#{Rails.root}/spec/fixtures/csv/discourse.csv" }

      it 'reads csv file' 

    end

    context '.send_invite' do
      let(:bulk_invite) { Jobs::BulkInvite.new }
      let(:user) { Fabricate(:user) }
      let(:group) { Fabricate(:group) }
      let(:topic) { Fabricate(:topic) }
      let(:email) { "evil@trout.com" }
      let(:csv_info) { [] }

      it 'creates an invite' 


      it 'creates an invite with group' 


      it 'creates an invite with topic' 


      it 'creates an invite with group and topic' 


    end

  end

end

