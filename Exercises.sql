SET SCHEMA 'goodreads_v2';

-- Exercise 2
SELECT id, first_name, last_name
FROM author
WHERE id = 23;

-- Exercise 3
SELECT isbn, title
FROM book
WHERE id = 24358527;

-- Exercise 4
SELECT COUNT(*)
FROM profile;

-- Exercise 5
SELECT COUNT(*)
FROM profile
WHERE first_name = 'Jaxx';

-- Exercise 6
SELECT first_name, COUNT(first_name) AS amount
FROM author
GROUP BY first_name
HAVING COUNT(first_name) >= 2;

-- Exercise 7
SELECT title, page_count
FROM book
ORDER BY page_count DESC;

-- Exercise 8
SELECT title, page_count
FROM book
WHERE page_count IS NOT NULL
ORDER BY page_count DESC;

-- Exercise 9
SELECT title, year_published
FROM book
WHERE year_published = 2017;

-- Exercise 10
SELECT id, publisher_name
FROM publisher
WHERE id = (SELECT publisher_id
            FROM book
            WHERE title = 'Tricked (The Iron Druid Chronicles,  #4)');

-- Exercise 11
SELECT type
FROM binding_type
WHERE id = (SELECT binding_id
            FROM book
            WHERE title = 'Fly by Night');

-- Exercise 12
SELECT COUNT(*)
FROM book
WHERE isbn IS NULL;

-- Exercise 13
SELECT COUNT(*)
FROM author
WHERE middle_name IS NOT NULL;

-- Exercise 14
SELECT author_id, COUNT(*) as books
FROM book
GROUP BY author_id
ORDER BY books DESC;

-- Exercise 15
SELECT MAX(page_count)
FROM book;

-- Exercise 16
SELECT title
FROM book
WHERE page_count = (SELECT MAX(page_count)
                    FROM book);

-- Exercise 17
SELECT COUNT(*)
FROM book_read
WHERE date_finished IS NOT NULL
      AND profile_id = (SELECT id
                    FROM profile
                    WHERE profile_name = 'Venom_Fate');

-- Exercise 18
SELECT COUNT(*)
FROM book
WHERE author_id = (SELECT id
                   FROM author
                   WHERE first_name = 'Brandon' AND last_name = 'Sanderson');

-- Exercise 19
SELECT COUNT(*)
FROM book_read
WHERE status = 'read'
  AND book_id = (SELECT id
                 FROM book
                 WHERE title = 'Gullstruck Island');

-- Exercise 20
SELECT COUNT(*)
FROM co_authors
WHERE author_id = (SELECT id
                   FROM author
                   WHERE first_name = 'Ray' AND last_name = 'Porter');

-- JOINS Exercises

-- Exercise 31

SELECT a.first_name, a.middle_name, a.last_name, b.title
FROM author AS a
         JOIN book AS b
              ON b.author_id = a.id
WHERE b.title LIKE '%The Summer Dragon%';

-- Exercise 32

SELECT b.title, bt.type
FROM book AS b
         JOIN binding_type AS bt
              ON bt.id = b.binding_id
WHERE b.title = 'Dead Iron (Age of Steam,  #1)';

-- Exercise 33

SELECT bt.type, COUNT(*) AS books
FROM binding_type AS bt
         JOIN book AS b
              ON bt.id = b.binding_id
GROUP BY bt.type
ORDER BY books DESC;

-- Exercise 34

SELECT p.profile_name, COUNT(*) AS books_read
FROM profile AS p
         JOIN book_read AS br
              ON p.id = br.profile_id
WHERE br.status = 'read'
GROUP BY p.profile_name
ORDER BY books_read DESC;

-- Exercise 35

SELECT g.genre
FROM genre AS g
         JOIN book_genre AS bg
              ON g.id = bg.genre_id
         JOIN book AS b
              ON bg.book_id = b.id
WHERE b.title = 'Hand of Mars (Starship''s Mage,  #2)';

-- Exercise 36

SELECT a.first_name, a.last_name
FROM author AS a
JOIN book AS b
    ON b.author_id = a.id
WHERE b.title = 'Dark One'
UNION
SELECT DISTINCT a.first_name, a.last_name
FROM author AS a
    JOIN co_authors AS co_a
        ON co_a.author_id = a.id
    JOIN book AS b
        ON co_a.book_id = b.id
WHERE b.title = 'Dark One';




--     JOIN author AS a
--         ON co_a.book_id = (SELECT b.id
--                            FROM book AS b
--                            WHERE b.title = 'Dark One');


