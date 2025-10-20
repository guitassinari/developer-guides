# Migrations

Migrations are a way to apply database changes in a versioned, reproducible way and with facilitaded rollbacks.

## Migration files

A migration file is usually named in a way that represents the order in which it should be applied. For example, `0001_initial_schema.sql` or `0001_initial_schema.down.sql`.

The content of a migration file is usually composed of a up/migrate section and a down/rollback section. The up section contains the SQL statements that should be executed to apply the migration, while the down section contains the SQL statements that should be executed to rollback the migration.

## Migration tools

Migration tools are the ones that handle the migration files and apply them to the database. They are responsible for avoiding duplicate migrations and for rolling back migrations when needed, as well as tracking the applied migrations through a migration history table.

## Migrations best practices

- Use transactions to ensure the changes are atomic and can be easily rolledback.
- Watch out for data loss on migrations that drop tables/columns.
- Test migrations in a development environment before applying them to production.