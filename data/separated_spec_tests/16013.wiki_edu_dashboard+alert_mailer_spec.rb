# frozen_string_literal: true

require 'rails_helper'

describe AlertMailer do
  let(:user) { create(:user, email: 'user@wikiedu.org') }
  let(:article) { create(:article, title: 'Almost_deleted') }
  let(:course) { create(:course) }
  let(:admin) { create(:admin, email: 'admin@wikiedu.org') }

  describe '.alert' do
    let(:mail) { described_class.alert(alert, user) }
    let(:admin_mail) { described_class.alert(alert, admin) }

    context 'for an ArticlesForDeletionAlert' do
      let(:alert) do
        create(:alert, type: 'ArticlesForDeletionAlert', article_id: article.id)
        Alert.last
      end

      it 'delivers an email with to the recipient' 


      it 'includes resolve link if the recipient is admin' 

    end
  end
end
