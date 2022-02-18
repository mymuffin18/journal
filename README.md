# Journal API

This is a Journal APP that can save tasks and its categories. This uses RESTFUL API so you can build your own frontend.
This app uses Ruby 3.0.2. To clone this app
`git clone https://github.com/mymuffin18/journal.git`
`cd journal`
run `bundle install`

# API ENDPOINTS

# User Registration
```
HTTP Method: POST
URL: {{url}}/api/v1/users/
```

Sample Request Body
```
{
    "email": "testing@email.com",
    "password": "12345678",
}
```

