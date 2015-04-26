# Jabba

> An example mashup of Phoenix/Ejabberd

This application allows users to register an account on ejabberd through a web
interface.

It uses an `ecto` model, but only for the changeset and validation features.

It also updates the users vcard with their full name, email and nickname.

The `jabba.dev` is for nice usage with [Pow](http://pow.cx).

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.
