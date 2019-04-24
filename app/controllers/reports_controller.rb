class ReportsController < ApplicationController
  layout 'reports'

  def index
  end

  def count_authors
    @report = Author.count_by_sql "SELECT count(id) FROM authors;"
    # source: https://api.rubyonrails.org/classes/ActiveRecord/Querying.html#method-i-count_by_sql
  end

  def count_books
    @report = Book.count_by_sql "SELECT count(id) FROM books;"
  end

  def books_by_topic
    @report = Book.group(:topic).count(:topic)
    # "SELECT topic, count(topic) FROM books GROUP BY topic;"
  end

  def books_by_topic_summary
    @report = Book.find_by_sql("SELECT topic, count(topic) as topic_count, min(pages) as min_pg,
      max(pages) as max_pg,
      round(avg(pages), 2) as avg_pages
      FROM books
      GROUP BY topic;")
    # some errors, see: https://www.speedshop.co/2019/01/10/three-activerecord-mistakes.html
  end

  def authors_join_books
    sql = "SELECT authors.name, topic, count(books.id)
      FROM authors
      JOIN books ON books.author_id = authors.id
      GROUP BY authors.name, topic
      HAVING count(books.id) > 4;"
    @report = ActiveRecord::Base.connection.exec_query(sql)
    puts "I am report: "
    pp @report
  end

  def index_explain
    sql = "EXPLAIN ANALYZE select id from books where topic = 'ruby' limit 1;"
    @report = ActiveRecord::Base.connection.execute(sql)
    puts "I am report: "
    pp @report
  end
end
