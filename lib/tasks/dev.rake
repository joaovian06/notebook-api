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
        birthdate: Date.new,
        kind: Kind.all.sample
      )
    end
  end
end
