require_relative '../../lib/pluck_translations'


describe "Pluck translations" do
  let(:translations) {
    {
      'en' => {'a' => 'blue', 'b' => {'c' => 'red' }},
      'es' => {'a' => 'azul', 'b' => {'c' => 'rojo'}},
    }
  }

  before do
    #setup input_en.yml and input_es.yml as simple example
    translations.each_pair do |locale, pairs|
      File.open("input.#{locale}.yml", 'w') do |f|
        f.write({locale => pairs}.to_yaml)
      end
    end
  end

  after do
    translations.each_pair do |locale, pairs|
      File.delete("input.#{locale}.yml")
      File.delete("output.#{locale}.yml")
    end
  end


  it "copys a set of strings from one place to another" 


  it "copys a set of strings to a nested place" 


  it 'deletes source keys after the copy' 

end

