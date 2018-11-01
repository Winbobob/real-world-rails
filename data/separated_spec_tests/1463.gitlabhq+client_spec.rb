require 'spec_helper'

describe Gitlab::FogbugzImport::Client do
  let(:client) { described_class.new(uri: '', token: '') }
  let(:one_user) { { 'people' => { 'person' => { "ixPerson" => "2", "sFullName" => "James" } } } }
  let(:two_users) { { 'people' => { 'person' => [one_user, { "ixPerson" => "3" }] } } }

  it 'retrieves user_map with one user' 


  it 'retrieves user_map with two users' 


  def stub_api(users)
    allow_any_instance_of(::Fogbugz::Interface).to receive(:command).with(:listPeople).and_return(users)
  end
end

