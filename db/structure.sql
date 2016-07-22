CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE events (timings varchar(255), id INTEGER PRIMARY KEY, title varchar(255), categories text, eventlocation varchar(255), cost text, sponser varchar(255), venue varchar(255), details text, created_at datetime, updated_at datetime);
INSERT INTO schema_migrations (version) VALUES ('20160722103940');
