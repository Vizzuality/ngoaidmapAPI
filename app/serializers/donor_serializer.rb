class DonorSerializer < ActiveModel::Serializer
  root :data
  attributes :type, :id, :name, :description, :website, :twitter, :facebook,
    :contact_person_name, :contact_company, :contact_person_position,
    :contact_email, :contact_phone_number, :site_specific_information,
    :logo

  def type
    'donor'
  end
end
