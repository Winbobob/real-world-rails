require "rails_helper"

describe RejectionMailer do

  describe "send_rejection" do

    context 'sends rejection email' do
      let (:user) { Fabricate(:user) }
      let (:template_args) { { former_title: "Mail Subject", destination: user.email, site_name: SiteSetting.title } }
      let (:reject_mail) { RejectionMailer.send_rejection("email_reject_topic_not_found", user.email, template_args) }

      it 'renders the senders email' 


      it 'renders the subject' 


      it 'renders site title in subject' 


      it 'renders the body' 

    end
  end
end

