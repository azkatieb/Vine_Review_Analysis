-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

SELECT * FROM vine_table

SELECT vt.review_id,
	vt.star_rating,
	vt.helpful_votes, 
	vt.total_votes, 
	vt.vine,
	vt.verified_purchase	
INTO helpful_vine
FROM vine_table as vt
WHERE total_votes >=20

SELECT hv.review_id,
	hv.star_rating,
	hv.helpful_votes, 
	hv.total_votes, 
	hv.vine,
	hv.verified_purchase
INTO reliable_votes
FROM helpful_vine as hv
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

SELECT rv.review_id,
	rv.star_rating,
	rv.helpful_votes, 
	rv.total_votes, 
	rv.vine,
	rv.verified_purchase
INTO paid_reviews
FROM reliable_votes as rv
WHERE (rv.vine) = 'Y'

SELECT rv.review_id,
	rv.star_rating,
	rv.helpful_votes, 
	rv.total_votes, 
	rv.vine,
	rv.verified_purchase
INTO unpaid_reviews
FROM reliable_votes as rv
WHERE (rv.vine) = 'N'

SELECT * FROM paid_reviews

SELECT * FROM unpaid_reviews
