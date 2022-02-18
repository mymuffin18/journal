# Journal API

This is a Journal APP that can save tasks and its categories. This uses RESTFUL API so you can build your own frontend.
This app uses Ruby 3.0.2. To clone this app
`git clone https://github.com/mymuffin18/journal.git`
`cd journal`
run `bundle install`

## API ENDPOINTS

### User Registration
```
HTTP Method: POST
URL: {{url}}/api/v1/users/
```

Sample Request Body
```
{
    "user": {
        "email": "testing@email.com",
        "password": "12345678"
    } 
}

```
Parameters
| Name     | Description   | Required |
|----------|---------------|----------|
| email    | user email    | Yes      |
| password | user password | Yes      |

Get this response header
| Name          | Description | Required |
|---------------|-------------|----------|
| Authorization | Your token  | Yes      |

## Login
```
HTTP Method: POST
URL: {{url}}/api/v1/users/sign_in
```
Sample Request Body
```
{
    "user": {
        "email": "testing@email.com",
        "password": "12345678"
    }
}
```
Parameters
| Name     | Description   | Required |
|----------|---------------|----------|
| email    | user email    | Yes      |
| password | user password | Yes      |

Get this response header
| Name          | Description | Required |
|---------------|-------------|----------|
| Authorization | Your token  | Yes      |

## LOGOUT
```
HTTP Method: DELETE
URL: {{url}}/api/v1/users/sign_out
```
Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Create Category
```
HTTP Method: POST
URL: {{url}}/api/v1/categories/
```
Sample Request Body
```
{
    "name": "example name",
    "description: "example description,
    "user_id": 1
}
```

Parameters
| Name        | Required |
|-------------|----------|
| name        | Yes      |
| description | Yes      |
| user_id     | Yes      |

Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Get all user's categories
```
HTTP Method: GET
URL: {{url}}/api/v1/categories/
```
Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Retrieve user's category
```
HTTP Method: GET
URL: {{url}}/api/v1/categories/:id
```
Parameters
| Name        | Description                                                                             | Required |
|-------------|-----------------------------------------------------------------------------------------|----------|
| :id | Category id this might return a 404 status if the current user doesn't own the category | Yes      |

Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Update user's category
```
HTTP Method: PUT
URL: {{url}}/api/v1/categories/:id
```

Sample Request Body
```
{
    "name": "updated name",
    "description": "updated description"
}
```

Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Delete user's category --OPTIONAL
```
HTTP Method: DELETE
URL: {{url}}/api/v1/categories/category_id
```

Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Get all user's tasks
```
HTTP Method: GET
URL: {{url}}/api/v1/tasks/
```
Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Retrieve user's task
```
HTTP Method: GET
URL: {{url}}/api/v1/tasks/task_id
```
| Name    | Description                                                                      | Required |
|---------|----------------------------------------------------------------------------------|----------|
| task_id | Task id this might return a 404 status if the current user doesn't own this Task | Yes      |


Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Create Task
```
HTTP Method: POST
URL: {{url}}/api/v1/tasks/
```

Sample Request Body
```
{
    "name": "task name",
    "description": "this is a description",
    "date": "2022-02-14",
    "category_id": 1
}
```
Parameters
| Name        | Description                                 | Required |
|-------------|---------------------------------------------|----------|
| name        | Task name                                   | Yes      |
| description | Task description                            | Yes      |
| date        | Your task schedule                          | Yes      |
| completed   | Boolean true or false. Has default of false | OPTIONAL |
| category_id | category id                                 | Yes      |


Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Update user task
```
HTTP Method: PUT
URL: {{url}}/api/v1/tasks/:id
```

Sample Request Body
```
{
    "name": "task name",
    "description": "this is a description",
    "date": "2022-02-14",
    "completed": true
}
```
NOTE:You can also use this endpoint if you only want to update the 'completed' value

Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration

## Delete Task
```
HTTP Method: DELETE
URL: {{url}}/api/v1/tasks/:id
```

Request Headers
| Name          | Required |
|---------------|----------|
| Authorization | Yes      |

You can get your token from signing in or from registration