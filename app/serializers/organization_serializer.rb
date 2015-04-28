class OrganizationSerializer < ActiveModel::Serializer
  attributes :type, :id, :name, :description, :website, :budget, :logo
  has_many :projects
  has_many :donations
  has_many :sites

  def type
    'organizations'
  end

  def logo
    object.logo(:medium)
  end
end
