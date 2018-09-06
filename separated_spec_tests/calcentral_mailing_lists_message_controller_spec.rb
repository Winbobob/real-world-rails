describe MailingListsMessageController do
  let(:message_params) { JSON.parse File.read(Rails.root.join('fixtures', 'json', 'mailgun_incoming_message.json')) }
  let(:make_request) { post :relay, message_params }

  shared_examples 'verification failed' do
    it 'returns empty 401' 

  end

  context 'missing signature' do
    before do
      message_params.delete 'signature'
    end
    include_examples 'verification failed'
  end

  context 'invalid signature' do
    before do
      message_params['timestamp'] = Time.now.to_i.to_s
      message_params['signature'] = OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest::SHA256.new,
        'wrong_api_key',
        message_params.values_at('timestamp', 'token').join
      )
    end
    include_examples 'verification failed'
  end

  context 'valid signature on expired timestamp' do
    before do
      message_params['timestamp'] = (Time.now.to_i - 3600).to_s
      message_params['signature'] = OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest::SHA256.new,
        Settings.mailgun_proxy.api_key,
        message_params.values_at('timestamp', 'token').join
      )
    end
    include_examples 'verification failed'
  end

  context 'valid signature on current timestamp' do
    before do
      message_params['timestamp'] = Time.now.to_i.to_s
      message_params['signature'] = OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest::SHA256.new,
        Settings.mailgun_proxy.api_key,
        message_params.values_at('timestamp', 'token').join
      )
      expect_any_instance_of(MailingLists::IncomingMessage).to receive(:relay).and_return true
    end

    it 'forwards to model and returns success' 


    it 'forbids repeated signatures' 


    context 'message with attachments' do
      let(:attachment_1) do
        ActionDispatch::Http::UploadedFile.new(
          filename: 'sample_student_72x96.jpg',
          tempfile: File.new(Rails.root.join 'public', 'dummy', 'images', 'sample_student_72x96.jpg'),
          type: 'image/jpg'
        )
      end
      let(:attachment_2) do
        ActionDispatch::Http::UploadedFile.new(
          filename: 'academic_dates.json',
          tempfile: File.new(Rails.root.join 'public', 'dummy', 'json', 'academic_dates.json'),
          type: 'application/json'
        )
      end
      before do
        message_params['attachment-1'] = attachment_1
        message_params['attachment-2'] = attachment_2
        message_params['attachment-count'] = '2'
        message_params['content-id-map'] = '{"<EC2CE1CA-4686-4412-88C7-EC9A2176D97F>": "attachment-1"}'
      end

      it 'handles attachments' 

    end
  end
end

