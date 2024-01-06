namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    kinds = %w(amigo comercial conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Date.today,
        kind: Kind.all.sample
      )
    end

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(
          number: Faker::PhoneNumber.cell_phone,
          contact_id: contact.id
        )

        contact.phones << phone
        contact.save!
      end
    end
  end
end
