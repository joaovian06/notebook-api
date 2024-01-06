namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Resetando banco de dados..."
    %x(rails db:drop db:create db:migrate)

    kinds = %w(amigo comercial conhecido)

    puts "Criando tipos de contato..."
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Tipos de contato criados com sucesso"

    puts "Criando contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Date.today,
        kind: Kind.all.sample
      )
    end
    puts "Contatos criados com sucesso"


    puts "Criando telefones para os contatos..."
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
    puts "Telefones de Contatos criados com sucesso"

    puts "Criando enderecos para os contatos..."
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts "Enderecos de contatos criados com sucesso"
  end
end
