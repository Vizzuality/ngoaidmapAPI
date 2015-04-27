require 'acceptance_helper'

resource 'Project' do
  header "Accept", "application/json; application/vnd.esios-api-v1+json"
  header "Content-Type", "application/json"
  header 'Host', 'http://api.ngoaidmap.org'

  get "/projects" do
    let!(:projects) do
      3.times do |p|
        FactoryGirl.create(:project, name: "project#{p}")
      end
    end

    example_request "Getting a list of projects" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)['data'].map{|r| r['name']}
      expect results.include?(['project0', 'project1', 'project2'])
    end
  end

  get "/projects?organizations[]=:organization" do
    parameter :organizations, "Array. Organization ids"
    p = FactoryGirl.create(:project, name: "project_with_organization")
    s = FactoryGirl.create(:organization)
    p.primary_organization_id = s.id
    p.save!
    let(:organization) do
      s.id
    end

    example_request "Getting a list of projects by implementing organization" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)['data'].map{|r| r['name']}
      puts results
      expect(results).to eq(['project_with_organization'])
    end
  end

  get "/projects?donors[]=:donor" do
    parameter :donors, "Array. Donor ids"
    p = FactoryGirl.create(:project, name: "project_with_donor")
    d = FactoryGirl.create(:donor)
    p.donors=[d]
    let(:donor) do
      d.id
    end

    example_request "Getting a list of projects by donors" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)['data'].map{|r| r['name']}
      expect(results).to eq(['project_with_donor'])
    end
  end

  get "/projects?sectors[]=:sector" do
    parameter :sector, "Array. Sector ids"
    p = FactoryGirl.create(:project, name: "project_with_sector")
    s = FactoryGirl.create(:sector)
    p.sectors=[s]
    let(:sector) do
      s.id
    end

    example_request "Getting a list of projects by sectors" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)['data'].map{|r| r['name']}
      expect(results).to eq(['project_with_sector'])
    end
  end

  get "/projects?countries[]=:country" do
    parameter :countries, "Array. Country ids"
    p = FactoryGirl.create(:project, name: "project_with_country")
    s = FactoryGirl.create(:country)
    p.countries=[s]
    let(:country) do
      s.id
    end

    example_request "Getting a list of projects by countries" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)['data'].map{|r| r['name']}
      expect(results).to eq(['project_with_country'])
    end
  end

  get "/projects?regions[]=:region" do
    parameter :regions, "Array. Region ids"
    p = FactoryGirl.create(:project, name: "project_with_region")
    s = FactoryGirl.create(:region)
    p.regions=[s]
    let(:region) do
      s.id
    end

    example_request "Getting a list of projects by regions" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)['data'].map{|r| r['name']}
      expect(results).to eq(['project_with_region'])
    end
  end

  let!(:project) do
    create(:project)
  end

  get "/projects/:id" do
    parameter :id, "A project's id"
    let(:id) { project.id }
    let(:name) { project.name }

    example_request "Get a particular project data" do
      expect(status).to eq(200)
      results = JSON.parse(response_body)
      expect(results.length).to be == 1
      expect(results['data']['name']).to  be == name
    end
  end

end
