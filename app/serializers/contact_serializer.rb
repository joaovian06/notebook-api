class ContactSerializer < ActiveModel::Serializer
  # Associations
  belongs_to :kind do
    link(:kind) { kind_url(object.kind.id) }
  end

  has_many :phones
  has_one :address

  # Hateaos links
  link(:self) { contact_url(object.id) }

  attributes :id, :name, :email, :birthdate#, :author

  meta do
    {
      author: "joao"
    }
  end

  # def author
  #   "author"
  # end

  def attributes(*args)
    h = super(*args)
    # pt-BR -- h[:birthdate] = I18n.l(object.birthdate) unless object.birthdate.blank?
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
