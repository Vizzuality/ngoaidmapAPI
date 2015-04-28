require 'acceptance_helper'

resource 'Organization' do
  header "Accept", "application/json; application/vnd.api+json"
  header "Content-Type", "application/vnd.api+json"
  header 'Host', 'http://api.ngoaidmap.org'

  get "/organizations" do
    let!(:organizations) do
      3.times do |o|
        FactoryGirl.create(:organization, name: "organization#{o}")
      end
    end

    example_request "Getting a list of organizations" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)['data'].map{|r| r['name']}
      expect results.include?(['organization0',
                               'organization1', 'organization2'])
    end
  end

end
