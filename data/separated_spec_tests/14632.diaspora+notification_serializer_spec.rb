# frozen_string_literal: true

describe NotificationSerializer do
  let(:notifications_controller) { NotificationsController.new }

  before do
    allow(notifications_controller).to receive(:current_user).and_return(notification.recipient)
    notifications_controller.request = ActionDispatch::TestRequest.new(host: AppConfig.pod_uri)
  end

  let(:notification) { FactoryGirl.create(:notification) }
  let(:json_output) {
    NotificationSerializer.new(notification, context: notifications_controller).to_json
  }

  subject(:parsed_hash) {
    JSON.parse json_output
  }

  it { is_expected.to have_key(notification.type.demodulize.underscore.to_s) }

  context "typed object" do
    let(:object) {
      parsed_hash[notification.type.demodulize.underscore]
    }

    it "have all properties set" 


    context "note_html" do
      before do
        # Nokogiri issue, see https://github.com/sparklemotion/nokogiri/issues/800
        # TODO: remove when the above issue is fixed
        expect_any_instance_of(ApplicationHelper).to receive(:timeago).and_return("")
      end

      let(:note_html) { object["note_html"] }

      it "contains valid html" 

    end
  end
end

