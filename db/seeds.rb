require 'faker'

Book.destroy_all
Author.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

40.times do |i|
  Author.create(
    name:     Faker::Book.unique.author,
    email:    Faker::Internet.unique.email,
    country:  Faker::Address.country,
    birth:    Faker::Date.birthday(18, 65)
  )
end

150.times do |b|
  Book.create(
    title:        Faker::Book.unique.title,
    pages:        rand(90..900),
    publish_date: Faker::Date.between(17.years.ago, Date.today),
    topic:        Faker::Book.genre,
    isbn:         Faker::Code.isbn,
    author_id:    rand(1..40)
  )
end
