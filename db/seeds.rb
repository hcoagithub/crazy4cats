# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

until Country.count == 20 do
    Country.create(name: Faker::Address.country) if
    !Country.pluck(:name).include?(Faker::Address.country)
end

countries = Country.all

until Aventura.count == 100 do
    Aventura.create(titulo: Faker::Book.title, descripcion:
    Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), fecha:
    Faker::Date.between(from: 10.years.ago, to: Date.today), imagen: Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true), country_id:
    countries.sample.id)
end

i = 0
until User.count == 20 do
    User.create(email: "test#{i}@gmail", password: "asdasdasd",
    "password_confirmation": "asdasdasd", photo: Faker::Avatar.image, name:
    Faker::Name.name)
    i += 1
end

aventuras = Aventura.all
users = User.all

until Comentario.count == 1000 do
    Comentario.create(contenido: Faker::Lorem.paragraph_by_chars(number: 200,
    supplemental: false), aventura_id: aventuras.sample.id, user_id:
    users.sample.id)
end

r_type = %w[aventura comentario]

comentarios = Comentario.all
kinds = Aventura::Kinds

until Reaction.count == 1000 do
    rel_type = r_type.sample
    if rel_type == "aventura"
        Reaction.create(aventura_id: aventuras.sample.id, user_id:
        users.sample.id, kind: kinds.sample)
    end
end

    