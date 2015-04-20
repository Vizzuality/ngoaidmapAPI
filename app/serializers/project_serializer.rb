class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :organization, serializer: OrganizationPreviewSerializer
  has_many :sectors, serializer: SectorPreviewSerializer
  has_many :countries, serializer: CountryPreviewSerializer
  has_many :regions, serializer: RegionPreviewSerializer

  def organization
    object.primary_organization
  end
end
