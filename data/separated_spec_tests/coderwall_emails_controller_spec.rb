RSpec.describe EmailsController, type: :controller, skip: true do
  let(:mailgun_params) do {
    'domain'     => ENV['MAILGUN_DOMAIN'],
    'tag'        => '*',
    'recipient'  => 'someone@example.com',
    'event'      => 'unsubscribed',
    'email_type' => NotifierMailer::ACTIVITY_EVENT,
    'timestamp'  => '1327043027',
    'token'      => ENV['MAILGUN_TOKEN'],
    'signature'  => ENV['MAILGUN_SIGNATURE'],
    'controller' => 'emails',
    'action'     => 'unsubscribe' }
  end

  it 'unsubscribes member from notifications when they unsubscribe from a notification email on mailgun' 


  it 'unsubscribes member from everything when they unsubscribe from a welcome email on mailgun' 

end

