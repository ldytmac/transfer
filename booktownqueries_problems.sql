-- Homework #2: EECS 484.
-- Your uniquname:
-- include your teamate's uniqname if you are working in team's of two

-- Your answer should work for any instance of the database, not just the one given.

-- EXAMPLE
-- Q0: "list titles of all books". Answer given below.

SELECT title FROM books;

-- Q1: List the ISBN of all books written by "Frank Herbert"
SELECT E.isbn
FROM editions E, books B, authors A 
WHERE E.book_id = B.book_id AND 
   	  B.author_id = A.author_id;


-- Q2: List last name and first name of authors who have written both
-- Short Story and Horror books. In general, there could be two different authors
-- with the same name, one who has written a horror book and another
-- who has written short stories. 
SELECT A.last_name, A.first_name 
FROM authors A, subjects S1, subjects S2, books B1, books B2
WHERE A.author_id = B1.author_id AND B1.subject_id = S1.subject_id
  AND A.author_id = B2.author_id AND B2.subject_id = S2.subject_id
  AND S1.subject = 'Short Story' AND S2.subject = 'Horror';



-- Q3: List titles, subjects, author's id, author's last name, and author's first name of all books 
-- by authors who have written Short Story book(s). Note: that this may
-- require a nested query. The answer can include non-Short Story books. You
-- can also use views. But DROP any views at the end of your query. Using
-- a single query is likely to be more efficient in practice.
SELECT B.title, S.subject, A.author_id, A.last_name, A.first_name
FROM books B, subjects S, authors A
WHERE A.author_id = B.author_id AND B.subject_id = S.subject_id
  AND A.author_id IN (SELECT B1.author_id 
  					  FROM  books B1, subjects S1
  					  WHERE B1.subject_id = S1.subject_id
  					    AND S1.subject = 'Short Story');


-- Q4: Find id, first name, and last name of authors who wrote books for all the 
-- subjects of books written by Edgar Allen Poe.
SELECT A.author_id, A.first_name, A.last_name
FROM 



-- Q5: Find the name and id of all publishers whos have published books for authors
-- who have written more than one book, order by ascending publisher id;



-- Q6: Find the last name and first name of authors who haven't written any book



-- Q7: Find the book_id and its corresponding total stock available for all book editions ordered
--     in descending order by the total stock. Name the column for total stock as NUM_STOCK. 
--     NOTE: You do not need to consider editions of books that are not in the Stock Table.




-- Q8: Find id of authors who have written exactly 1 book. Name the column as id. 
-- Order the id in ascending order


