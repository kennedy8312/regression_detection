drop table if exists t0;
CREATE TABLE t0(c0 DECIMAL ZEROFILL UNIQUE , c1 BOOL ZEROFILL AS (-1));
INSERT IGNORE  INTO t0(c0) VALUES (NULL);
CREATE INDEX i0 ON t0(c1 ASC, c0 DESC);
SELECT t0.c1 FROM t0;
SELECT t0.c1 FROM t0 WHERE (t0.c0 IS NULL);