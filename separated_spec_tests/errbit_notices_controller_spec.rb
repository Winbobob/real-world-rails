describe Api::V3::NoticesController, type: :controller do
  let(:app) { Fabricate(:app) }
  let(:project_id) { app.api_key }
  let(:legit_params) { { project_id: project_id, key: project_id } }
  let(:legit_body) do
    Rails.root.join('spec', 'fixtures', 'api_v3_request.json').read
  end

  it 'sets CORS headers on POST request' 


  it 'responds to an OPTIONS request' 


  it 'returns created notice id in json format' 


  it 'responds with 201 created on success' 


  it 'responds with 201 created on success with token in Airbrake Token header' 


  it 'responds with 201 created on success with token in Authorization header' 


  it 'responds with 422 when Authorization header is not valid' 


  it 'responds with 400 when request attributes are not valid' 


  it 'responds with 422 when notice comes from an old app' 


  it 'responds with 422 when project_id is invalid' 


  it 'ignores notices for older api' 

end

