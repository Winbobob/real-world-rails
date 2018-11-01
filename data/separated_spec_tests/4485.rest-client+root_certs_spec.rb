require_relative '../_lib'

describe 'RestClient::Windows::RootCerts',
         :if => RestClient::Platform.windows? do
  let(:x509_store) { RestClient::Windows::RootCerts.instance.to_a }

  it 'should return at least one X509 certificate' 


  it 'should return an X509 certificate with a subject' 


  it 'should return X509 certificate objects' 

end

