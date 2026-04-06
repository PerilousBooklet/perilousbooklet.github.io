# ?

Inspect the current IDs sequence: 

```sql
SELECT nextval(pg_get_serial_sequence('clients', 'id'));
SELECT currval(pg_get_serial_sequence('clients', 'id'));
```

Realign IDs sequence: 

```sql
SELECT setval(pg_get_serial_sequence('clients', 'id'), (SELECT MAX(id) FROM clients));
```

