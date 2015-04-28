class OrganizationSerializer < ActiveModel::Serializer
  attributes :type, :id, :name, :description, :sectors
  has_many :projects, serializer: ProjectSerializer
  def type
    'organizations'
  end
  def sectors
    sectors = []
    object.projects.each do |project|
      project.sectors.each do |sector|
        sectors << { id: sector.id, name: sector.name }
      end
    end
    sectors
  end
end
