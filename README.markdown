This project is a sample project to show how to use SimpleWorker in Rails (it's very easy).

# Getting Started

## Configuration

Get your SimpleWorker keys at http://www.simpleworker.com . Then create a config/private.yml file with:

```
sw:
    token: MY_TOKEN
    project_id: MY PROJECT ID

gmail:
    username: gmail_username@gmail.com
    password: gmail_password
```

### Database

Create a config/database.yml file with your database credentials, typical Rails style. Database must be accessible from external hosts.

