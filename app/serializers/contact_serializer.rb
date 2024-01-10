module V1
  class ContactSerializer < ActiveModel::Serializer
    # Associations
    belongs_to :kind do
      link(:related) { contact_kind_url(object.id) }
    end

    has_many :phones do
      link(:related) { contact_phones_url(object.id) }
    end

    has_one :address do
      link(:related) { contact_address_url(object.id) }
    end

    # Hateaos links
    # link(:self) { contact_url(object.id) }

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
end
