This project is a sample project to show how to use SimpleWorker in Rails (it's very easy).

When running the application, be sure to set the following environment variables:

```
SIMPLEWORKER_ACCESS_KEY=ABC
SIMPLEWORKER_SECRET_KEY=XYZ
DB_HOST
DB_PORT
DB_NAME
DB_USER
DB_PASS
GMAIL_USER
GMAIL_PASS
```

These are used in application.rb to configure SimpleWorker.

## SimpleWorker Keys

Get your keys at [[http://www.simpleworker.com]]

## Database

If you want to setup a quick, free cloud database to try this out, check out [Xeround](http://xeround.com/). 

## Mail

This example app uses gmail to send mail so you need to supply your gmail credentials in the GMAIL_USER and
GMAIL_PASS environment variables.
