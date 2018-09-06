require_relative '_lib'

describe RestClient do
  describe "API" do
    it "GET" 


    it "POST" 


    it "PUT" 


    it "PATCH" 


    it "DELETE" 


    it "HEAD" 


    it "OPTIONS" 

  end

  describe "logging" do
    after do
      RestClient.log = nil
    end

    it "uses << if the log is not a string" 


    it "displays the log to stdout" 


    it "displays the log to stderr" 


    it "append the log to the requested filename" 

  end

  describe 'version' do
    # test that there is a sane version number to avoid accidental 0.0.0 again
    it 'has a version > 2.0.0.alpha, < 3.0' 

  end
end

