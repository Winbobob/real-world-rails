require 'rails_helper'

describe User::Create do
  let(:defaults) do
    {
      first_name: "foo",
      last_name: "bar",
      email: "baz@bing.com",
      password: "Password1",
      password_confirmation: "Password1",
      language: 0,
      accept_terms: true
    }
  end

  context '#validate' do
    context 'email' do
      it "fails if invalid format" 


      it "fails on empty" 


      it "fails on nil" 

    end

    context 'password' do
      it "fails on nil" 


      it "must be confirmed" 


      it "must have an integer" 


      it "must have a capital letter" 


      it "must be 8 characters long" 


      it "passes" 

    end
  end
end

