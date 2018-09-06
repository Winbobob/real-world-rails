require 'rails_helper'

describe CsvExportMailer, type: :mailer do

  describe 'csv_download' do
    let(:csv_export) { create(:csv_export, teacher: teacher) }
    let(:teacher) { create(:teacher) }
    let(:mail) { CsvExportMailer.csv_download(csv_export) }

    before do
      csv_export.export!
    end

    it 'renders the subject' 


    it 'renders the receiver' 


    it 'renders the sender' 


    it 'contains the URL for the CSV' 

  end
end

