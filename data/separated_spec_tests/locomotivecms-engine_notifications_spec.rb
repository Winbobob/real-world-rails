# encoding: utf-8

describe Locomotive::Notifications do

  describe 'new_content_entry' do

    let(:now)           { Time.use_zone('America/Chicago') { Time.zone.local(1982, 'sep', 16, 14, 0) } }
    let(:site)          { build(:site, name: 'Acme', domains: %w{www.acme.com}, timezone_name: 'Paris') }
    let(:account)       { build(:account, email: 'bart@simpson.net') }
    let(:content_type)  { build(:content_type, site: site) }
    let(:content_entry) { build(:content_entry, content_type: content_type, site: site) }

    let(:mail) { Locomotive::Notifications.new_content_entry(account, content_entry) }

    it 'renders the subject' 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'outputs the current time in the correct time zone' 


    it 'outputs the domain in the email body' 


    it 'outputs the description of the content type in the email body' 


    describe 'rendering based on field types' do

      describe 'text type' do

        let(:content_type)  { build(:content_type, :with_text_field, site: site) }
        let(:content_entry) { content_type.entries.build(description: "hello\nworld", site: site) }

        it 'outputs the formatted value of the text field' 


      end

      describe 'date time type' do

        let(:content_type)  { build(:content_type, :with_date_time_field, site: site) }
        let(:content_entry) { content_type.entries.build(time: DateTime.parse('2015/09/26 10:45pm CDT'), site: site) }

        it 'outputs the formatted value of the date time field' 


      end

    end

    context 'custom title' do

      before do
        content_type.public_submission_title_template = "{{ site.name }} - you have a message"
      end

      it 'renders the subject' 


    end

  end

  def set_timezone(&block)
    Time.use_zone(site.try(:timezone) || 'UTC', &block)
  end

end

