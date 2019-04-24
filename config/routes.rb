Rails.application.routes.draw do
  root 'reports#index'

  resources :books, :authors

  namespace :reports do
    get 'index', 'count_authors', 'count_books', 'books_by_topic',
        'books_by_topic_summary', 'authors_join_books', 'index_explain'
  end

end
