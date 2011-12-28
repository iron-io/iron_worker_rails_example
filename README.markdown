This project is a sample project to show how to use IronWorker in Rails (it's very easy).

# Getting Started

## Configuration

Get your IronWorker keys at http://www.iron.io . Then create a config/private.yml file with:

```
iron:
    token: MY_TOKEN
    project_id: MY PROJECT ID

gmail:
    username: gmail_username@gmail.com
    password: gmail_password
```

### Database

Create a config/database.yml file with your database credentials, typical Rails style. Database must be accessible from external hosts.

