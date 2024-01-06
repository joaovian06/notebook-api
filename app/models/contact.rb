class Contact < ApplicationRecord
    belongs_to :kind

    def author
        "joao vian"
    end

    def as_json(options={})
        super(methods: :author, root: true)
    end
end
