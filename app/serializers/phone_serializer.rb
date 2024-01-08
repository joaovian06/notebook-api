class PhoneSerializer < ActiveModel::Serializer
  belongs_to :contact do
    link(:related) { contact_phones_url(object.contact.id) }
  end
  
  attributes :id, :number
end
