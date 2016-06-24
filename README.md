# pg_notify_listener

This is a quick Proof of Concept that listens on a couple of PG NOTIFY channels for messages.

To run:

`docker run -it --rm --link db:db --name pg_notify_listener deinspanjer/pg_notify_listener postgres://postgres@db/multitenant`
