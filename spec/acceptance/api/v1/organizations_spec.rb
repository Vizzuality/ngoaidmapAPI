require 'acceptance_helper'

resource 'Organizations' do
  header "Accept", "application/json; application/vnd.api+json"
  header "Content-Type", "application/vnd.api+json"
  header 'Host', 'http://api.ngoaidmap.org'

  let!(:organization) do
    create(:organization)
  end

  get "/organizations/:id" do
    parameter :id, "An organization's id"
    let(:id) { organization.id }
    let(:name) { organization.name }

    example_request "Get data for one organization" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)
      expect(results.length).to be == 1
      expect(results['data']['name']).to  be == name
    end
  end

  get "/organizations/:id" do
    parameter :id, "A organization's id"
    let(:id) { organization.id + 1 }

    example "Get the data of a non existing organization", document: false do
      do_request(id: :id)
      expect(status).to eq(404)
      results = JSON.parse(response_body)
      expect(results.length).to be == 1
      expect(results['errors'].first['status']).to be == '404'
    end
  end
end
