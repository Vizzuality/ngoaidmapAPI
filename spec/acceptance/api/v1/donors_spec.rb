require 'acceptance_helper'

resource 'Donors' do
  header "Accept", "application/json; application/vnd.esios-api-v1+json"
  header "Content-Type", "application/json"
  header 'Host', 'http://'

  let!(:donor) do
    create(:donor)
  end

  get "/donors/:id" do
    parameter :id, "A donor's id"
    let(:id) { donor.id }
    let(:name) { donor.name }

    example_request "Get a donor's show page" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)
      expect(results.length).to be == 1
      expect(results['data']['name']).to  be == name
    end
  end
end
