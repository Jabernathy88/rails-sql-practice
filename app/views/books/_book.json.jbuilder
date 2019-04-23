json.extract! book, :id, :title, :pages, :publish_date, :topic, :isbn, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
