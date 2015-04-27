require 'acceptance_helper'

resource 'Donors' do
  header "Accept", "application/json; application/vnd.api+json"
  header "Content-Type", "application/vnd.api+json"
  header 'Host', 'http://api.ngoaidmap.org'

  let!(:donor) do
    create(:donor)
  end

  get "/donors/:id" do
    parameter :id, "A donor's id"
    let(:id) { donor.id }
    let(:name) { donor.name }

    example_request "Get a particular donor data" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)
      expect(results.length).to be == 1
      expect(results['data']['name']).to  be == name
    end
  end

  get "/donors/:id" do
    parameter :id, "A donor's id"
    let(:id) { donor.id + 1 }

    example_request "Get the data of a non existing donor" do
      expect(status).to eq(404)
      results = JSON.parse(response_body)
      expect(results.length).to be == 1
      expect(results['errors'].first['status']).to be == '404'
    end
  end
end
