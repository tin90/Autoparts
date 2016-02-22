INSERT INTO STORAGE (POCODE,
                     INDATE,
                     OUTDATE,
                     INYN,
                     OUTYN)
     VALUES ('1',
             TO_DATE ('02/17/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('02/17/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             'Y',
             'Y');

INSERT INTO STORAGE (POCODE,
                     INDATE,
                     OUTDATE,
                     INYN,
                     OUTYN)
     VALUES ('2',
             TO_DATE ('02/16/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('03/12/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             'Y',
             'Y');

INSERT INTO STORAGE (POCODE,
                     INDATE,
                     OUTDATE,
                     INYN,
                     OUTYN)
     VALUES ('3',
             TO_DATE ('01/30/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('02/15/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             'Y',
             'Y');

INSERT INTO STORAGE (POCODE,
                     INDATE,
                     OUTDATE,
                     INYN,
                     OUTYN)
     VALUES ('4',
             TO_DATE ('02/03/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('02/24/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             'Y',
             'Y');

INSERT INTO STORAGE (POCODE,
                     INDATE,
                     OUTDATE,
                     INYN,
                     OUTYN)
     VALUES ('5',
             TO_DATE ('12/30/2015 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('01/25/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'),
             'Y',
             'Y');

COMMIT;