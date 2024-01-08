class AddressSerializer < ActiveModel::Serializer
  belongs_to :contact do
    link(:related) { contact_address_url(object.contact.id) }
  end

  attributes :id, :street, :city
end
