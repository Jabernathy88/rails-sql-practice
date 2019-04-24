# README

Based on RailsConf talk by Ryan Dlugosz, [Level-up Your ActiveRecord Skills: Learn SQL](https://www.youtube.com/watch?v=4xjSXp-oBvc).

Queries:

* How many Authors do we have?

```
SELECT count(id) FROM books;
# Book.count
```

* How many Books?

```
SELECT count(id) FROM authors;
Author.count
```

* How many books do we have in each topic?

```
SELECT topic, count(topic)
  FROM books
  GROUP BY topic;
# Book.group(:topic).count(:topic)
```

* How many books in each topic && min, max, page count by topic?

```
SELECT topic, count(topic) as topic_count,
    min(pages) as min_pg,
    max(pages) as max_pg,
    rount(avg(pages), 2) as avg_pages
  FROM books
  GROUP BY topic;
```

### Joining Data

* Which authors have written 5 or more books in a topic?

```
SELECT authors.name, topic, count(books.id)
FROM authors
  JOIN books ON books.author_id = authors.id
GROUP BY authors.name, topic
HAVING count(books.id) > 4;
```

### Explain SQL utility

```
EXPLAIN ANALYIZE select id from books where topic = 'ruby' limit 1;
```

^ above will reveal a sequential scan.

Migration:
```
class AddIndexToBook Topic
  def change
    add_index :books, :topic
  end
end
```
