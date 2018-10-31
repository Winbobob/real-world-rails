require "spec_helper"

describe JsonSpec::Matchers::BeJsonEql do
  it "matches identical JSON" 


  it "matches differently-formatted JSON" 


  it "matches out-of-order hashes" 


  it "doesn't match out-of-order arrays" 


  it "matches valid JSON values, yet invalid JSON documents" 


  it "matches at a path" 


  it "ignores excluded-by-default hash keys" 


  it "ignores custom excluded hash keys" 


  it "ignores nested, excluded hash keys" 


  it "ignores hash keys when included in the expected value" 


  it "doesn't match Ruby-equivalent, JSON-inequivalent values" 


  it "matches different looking, JSON-equivalent values" 


  it "excludes extra hash keys per matcher" 


  it "excludes extra hash keys given as symbols" 


  it "excludes multiple keys" 


  it "includes globally-excluded hash keys per matcher" 


  it "includes globally-included hash keys given as symbols" 


  it "includes multiple keys" 


  it "provides a description message" 


  it "provides a description message with path" 


  it "raises an error when not given expected JSON" 


  it "matches file contents" 

end

