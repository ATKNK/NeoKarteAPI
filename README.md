# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Authentication

Authentication uses an encrypted, HTTP-only cookie session.

- `GET /csrf_token` returns a CSRF token. Send it in the `X-CSRF-Token` header
  for `POST` and `DELETE` requests. Fetch a fresh token after signing in.
- `POST /users` creates an account and starts a session. The JSON body should
  contain `user.email_address`, `user.password`, and
  `user.password_confirmation`.
- `POST /session` signs in with `email_address` and `password`.
- `GET /session` returns the signed-in user; `DELETE /session` signs out.

Browser clients must send requests with credentials enabled. The API's
`FRONT_HOST` environment variable must match the browser origin.
