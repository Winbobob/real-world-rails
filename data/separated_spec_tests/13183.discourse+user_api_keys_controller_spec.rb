require 'rails_helper'

describe UserApiKeysController do

  let :public_key do
    <<~TXT
    -----BEGIN PUBLIC KEY-----
    MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDh7BS7Ey8hfbNhlNAW/47pqT7w
    IhBz3UyBYzin8JurEQ2pY9jWWlY8CH147KyIZf1fpcsi7ZNxGHeDhVsbtUKZxnFV
    p16Op3CHLJnnJKKBMNdXMy0yDfCAHZtqxeBOTcCo1Vt/bHpIgiK5kmaekyXIaD0n
    w0z/BYpOgZ8QwnI5ZwIDAQAB
    -----END PUBLIC KEY-----
    TXT
  end

  let :private_key do
    <<~TXT
    -----BEGIN RSA PRIVATE KEY-----
    MIICWwIBAAKBgQDh7BS7Ey8hfbNhlNAW/47pqT7wIhBz3UyBYzin8JurEQ2pY9jW
    WlY8CH147KyIZf1fpcsi7ZNxGHeDhVsbtUKZxnFVp16Op3CHLJnnJKKBMNdXMy0y
    DfCAHZtqxeBOTcCo1Vt/bHpIgiK5kmaekyXIaD0nw0z/BYpOgZ8QwnI5ZwIDAQAB
    AoGAeHesbjzCivc+KbBybXEEQbBPsThY0Y+VdgD0ewif2U4UnNhzDYnKJeTZExwQ
    vAK2YsRDV3KbhljnkagQduvmgJyCKuV/CxZvbJddwyIs3+U2D4XysQp3e1YZ7ROr
    YlOIoekHCx1CNm6A4iImqGxB0aJ7Owdk3+QSIaMtGQWaPTECQQDz2UjJ+bomguNs
    zdcv3ZP7W3U5RG+TpInSHiJXpt2JdNGfHItozGJCxfzDhuKHK5Cb23bgldkvB9Xc
    p/tngTtNAkEA7S4cqUezA82xS7aYPehpRkKEmqzMwR3e9WeL7nZ2cdjZAHgXe49l
    3mBhidEyRmtPqbXo1Xix8LDuqik0IdnlgwJAQeYTnLnHS8cNjQbnw4C/ECu8Nzi+
    aokJ0eXg5A0tS4ttZvGA31Z0q5Tz5SdbqqnkT6p0qub0JZiZfCNNdsBe9QJAaGT5
    fJDwfGYW+YpfLDCV1bUFhMc2QHITZtSyxL0jmSynJwu02k/duKmXhP+tL02gfMRy
    vTMorxZRllgYeCXeXQJAEGRXR8/26jwqPtKKJzC7i9BuOYEagqj0nLG2YYfffCMc
    d3JGCf7DMaUlaUE8bJ08PtHRJFSGkNfDJLhLKSjpbw==
    -----END RSA PRIVATE KEY-----
    TXT
  end

  let :args do
    {
      scopes: 'read',
      client_id: "x" * 32,
      auth_redirect: 'http://over.the/rainbow',
      application_name: 'foo',
      public_key: public_key,
      nonce: SecureRandom.hex
    }
  end

  context 'new' do
    it "supports a head request cleanly" 

  end

  context 'create' do

    it "does not allow anon" 


    it "refuses to redirect to disallowed place" 


    it "will allow tokens for staff without TL" 


    it "will not create token unless TL is met" 


    it "will deny access if requesting more rights than allowed" 


    it "allows for a revoke with no id" 


    it "will not allow readonly api keys to revoke others" 


    it "will allow readonly api keys to revoke self" 


    it "will not return p access if not yet configured" 


    it "will redirect correctly with valid token" 

  end
end
