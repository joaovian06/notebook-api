class Contact < ApplicationRecord
    belongs_to :kind, optional: true

    def birthdate_br
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    def to_br
        { 
            name: self.name, 
            birthdate: I18n.l(self.birthdate) 
        }   
    end

    # def author
    #     "joao vian"
    # end

    # def kind_description
    #     self.kind.description
    # end

    # def as_json(options={})
    #     super(
    #         methods: [:kind_description, :author],
    #         root: true
    #     )
    # end

    # def hello
    #     I18n.t(:hello)
    # end

    # def i18n
    #     I18n.default_locale
    # end
end
