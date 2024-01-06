class Contact < ApplicationRecord
    belongs_to :kind

    def author
        "joao vian"
    end

    def kind_description
        self.kind.description
    end

    def as_json(options={})
        super(
            methods: [:kind_description, :author],
            root: true
        )
    end
end
