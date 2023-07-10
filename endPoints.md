### Initial endpoint:
```
http://example.com/api/v1
```

### Book endpoints
#### Get all books
```
GET /books?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Response body 
[
  {
    "id": 1,
    "book_name": "Catcher in the Rye",
    "isbn": "9780316769488",
    "author": 
      [
        "J. D. Salinger",
      ], 
    "genre": 
      [
        "Novel",
      ],
    "published_year": 1951,
    "avg_rating": 4.2,
    "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
    "reviews": 
      [
        {
          "id": 1,
          "user_name": "John Doe",
          "rating": 5,
          "comment": "This is a great book"
        },
        {
          "id": 2,
          "user_name": "Jane Doe",
          "rating": 4,
          "comment": "What a wonderful story!!!"
        },
        ...
      ]
  },
  {
    "id": 2,
    "book_name": "Harry Potter and the Philosopher's Stone",
    "isbn": "9780747532743",
    "author": 
      [
        "J. K. Rowling",
      ],
    "genre": 
      [
        "Fantasy",
        "Novel",
      ],
    "published_year": 1997,
    "rating": 4.5,
    "description": "Harry Potter and the Philosopher's Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling's debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/I/51UoqRAxwEL._SX331_BO1,204,203,200_.jpg",
    "reviews": 
      [
        {
          "id": 4,
          "user_name": "John Smith",
          "rating": 5,
          "comment": "This is a great book"
        },
        {
          "id": 5,
          "user_name": "Jane Smith",
          "rating": 4,
          "comment": "What a wonderful story!!!"
        },
        ...
      ]
  },
  ...
]
```

#### Get book by id
```
GET /books/:bookId

# Response body 
{
    "id": 1,
    "book_name": "Catcher in the Rye",
    "isbn": "9780316769488",
    "author": 
      [
        "J. D. Salinger",
      ], 
    "genre": 
      [
        "Novel",
      ],
    "published_year": 1951,
    "avg_rating": 4.2,
    "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
    "reviews": 
      [
        {
          "id": 1,
          "user_name": "John Doe",
          "rating": 5,
          "comment": "This is a great book"
        },
        {
          "id": 2,
          "user_name": "Jane Doe",
          "rating": 4,
          "comment": "What a wonderful story!!!"
        },
        ...
      ]
  }
```

#### Create book
This endpoint is only allowed for librarian to add a new book to the database.
```
POST /books

# Headers
{
  "Authorization": "Bearer {token}"
}

# Request body 
{
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}

# Response body 
{
  "book_id": 1,
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}
```

#### Update book
```
PUT /books/:bookId

# Headers
{
  "Authorization": "Bearer {token}"
}

# Request body 
{
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}

# Response body 
{
  "book_id": {bookId},
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}
```

#### Delete book
```
DELETE /books/:bookId

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body 
{
  "message": "Book is deleted successfully"
}
```

### Author endpoints
#### Get all authors
```
GET /authors?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Response body
[
  {
    "id": 1,
    "author_name": "J. D. Salinger",
  },
  {
    "id": 2,
    "author_name": "J. K. Rowling",
  },
  ...
]
```

#### Get author by id
```
GET /authors/:authorId

# Response body
{
  "id": 1,
  "author_name": "J. D. Salinger",
}
```

#### Create author
This endpoint is only allowed for librarian to add a new author to the database.
```
POST /authors

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "author_name": "J. D. Salinger",
}

# Response body
{
  "id": 1,
  "author_name": "J. D. Salinger",
}
```

#### Update author
This endpoint is only allowed for librarian to update an author in the database.
```
PUT /authors/:authorId

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "author_name": "J. D. Salinger",
}

# Response body
{
  "id": {authorId},
  "author_name": "J. D. Salinger",
}
```

#### Delete author
This endpoint is only allowed for librarian to delete an author from the database.
```
DELETE /authors/:authorId

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "message": "Author is deleted successfully"
}
```

### Genre endpoints
#### Get all genres
```
GET /genres?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Response body
[
  {
    "id": 1,
    "genre_name": "Novel",
  },
  {
    "id": 2,
    "genre_name": "Fantasy",
  },
  ...
]
```

#### Get genre by id
```
GET /genres/:genreId

# Response body
{
  "id": 1,
  "genre_name": "Novel",
}
```

#### Create genre
This endpoint is only allowed for librarian to add a new genre to the database.
```
POST /genres

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "genre_name": "Novel",
}

# Response body
{
  "id": 1,
  "genre_name": "Novel",
}
```

#### Update genre
This endpoint is only allowed for librarian to update a genre in the database.
```
PUT /genres/:genreId

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "genre_name": "Novel",
}

# Response body
{
  "id": {genreId},
  "genre_name": "Novel",
}
```

#### Delete genre
This endpoint is only allowed for librarian to delete a genre from the database.
```
DELETE /genres/:genreId

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "message": "Genre is deleted successfully"
}
```

### Authentication endpoints
#### Register
```
POST /auth/register

# Request body
{
  "first_name": "John",
  "last_name": "Doe",
  "password": "password",
  "email": "email",
  "role": "customer"
}

# Response body
{
  "message": "User is registered successfully"
}
```

#### Login
```
POST /auth/login

# Request body
{
  "email": "email",
  "password": "password"
}

# Response body
{
  "message": "User is logged in successfully",
  "token": "token"
}
```

#### Logout
```
POST /auth/logout

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "message": "User is logged out successfully"
}
```

### User endpoints
#### Get all users
This endpoint is only allowed for librarian to query all users from the database.
```
GET /users?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body
[
  {
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "john@mail.com"
  },
  {
    "id": 2,
    "first_name": "Jane",
    "last_name": "Doe",
    "email": "jane@mail.com"
  },
  ...
]
```

#### Get a user by id
This endpoint is only allowed for librarian to query one spcific user from the database and the user to see his/her own profile.
```
GET /users/:userId

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "first_name": "John",
  "last_name": "Doe",
  "email": "email"
}
```

#### Get all loans from a user
This endpoint is only allowed for librarian to query all loans from the database or the user to see his/her own loans. 
```
GET /users/:userId/loans?startDate={start_date}&endDate={end_date}&isReturned={is_returned}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body 
[
  {
    "loan_id": 1,
    "book_name": "Catcher in the Rye",
    "borrow_date": "2023-06-01",
    "return_date": "2023-06-31",
    "due_date": "2023-07-01"
  },
  {
    "loan_id": 2,
    "book_name": "Harry Potter and the Philosopher's Stone",
    "borrow_date": "2023-07-01",
    "return_date": null, # null if the book is not returned yet
    "due_date": "2023-08-01"
  },
  ...
]
```

#### Get all fines from a user
This endpoint is only allowed for librarian to query all fines from the database or the user to see his/her own fines.
```
GET /users/:userId/fines?startDate={start_date}&endDate={end_date}&isPaid={is_paid}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Header
{
  "Authorization": "Bearer {token}"
}

# Response body
[
  {
    "fine_id": 1,
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "book_name": "Harry Potter and the Prisoner of Azkaban",
    "balance": 10,
  },
  {
    "fine_id": 2,
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "book_name": "1984",
    "balance": 5,
  },
  ...
]
```

#### Update a user
```
PUT /users/:userId

# Headers
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "first_name": "John",
  "last_name": "Doe",
  "email": "john@mail.com",
  "password": "1234"
}

# Response body
{
  "message": "User is updated successfully"
}
```

#### Delete a user
This endpoint is only allowed for librarian to delete one spcific user from the database or the user to delete his/her own account.
```
DELETE /users/:userId

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "message": "User is deleted successfully"
}
```

### Loan endpoints
#### Get all loans from all users
This endpoint is only allowed for librarian to query all loans from the database.
```
GET /loans?startDate={start_date}&endDate={end_date}&isReturned={is_returned}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body
[
  {
    "loan_id": 1,
    "user_name": "John Doe",
    "book_name": "Harry Potter and the Philosopher's Stone",
    "borrow_date": "2023-07-01",
    "return_date": null, # null if the book is not returned yet
    "due_date": "2023-08-01"
  },
  {
    "loan_id": 2,
    "user_name": "Jane Doe",
    "book_name": "Catch-22",
    "borrow_date": "2023-07-01",
    "return_date": "2023-07-09",
    "due_date": "2023-08-01"
  },
  ...
]
```

#### Get a loan by id
This endpoint is only allowed for librarian to query one specific loan from the database.
```
GET /loans/:loanId

# Headers
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "loan_id": {loanId},
  "user_name": "John Doe",
  "book_name": "Harry Potter and the Philosopher's Stone",
  "borrow_date": "2023-07-01",
  "return_date": null, # null if the book is not returned yet
  "due_date": "2023-08-01"
}
```

#### Create a loan
This endpoint is used when the user borrows a book.
```
POST /loans

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "book_id": 1,
}

# Response body
{
  "loan_id": 1,
  "user_id": {userId}, # user_id is taken from the token
  "book_id": 1,
  "borrow_date": "2023-07-01", # borrow_date is the current date
  "return_date": null, # null if the book is not returned yet
  "due_date": "2023-08-01", # due_date is the borrow_date + borrowing_period of the book
}
```

#### Update a loan
This endpoint is used when the user wants to extends the due date for a certain book.
```
PUT /loans/:loanId

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "book_id": 1,
}

# Response body
{
  "loan_id": {loanId},
  "user_id": {userId}, # user_id is taken from the token
  "book_id": 1,
  "borrow_date": "2023-07-01",
  "return_date": null, # null if the book is not returned yet
  "due_date": "2023-09-01" # due_date is the borrow_date + borrowing_period of the book
}
```

#### Delete a loan
This endpoint is used by the librarian to delete a loan from the database.
```
DELETE /loans/:loanId

# Headers 
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "message": "Loan is deleted successfully"
}
```

### Fine endpoints
#### Get all fines from all users
This endpoint is only allowed for librarian to query all fines from the database.
```
GET /fines?startDate={start_date}&endDate={end_date}&isPaid={is_paid}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}

# Header
{
  "Authorization": "Bearer {token}"
}

# Response body
[
  {
    "id": 1,
    "user_name": "John Doe",
    "email": "john@mail.com",
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "payment_date": null, # null if the fine is not paid yet
    "book_name": "Harry Potter and the Prisoner of Azkaban",
    "balance": 10,
  },
  {
    "id": 2,
    "user_name": "Jane Doe",
    "email": "jane@mail.com",
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "payment_date": "2023-07-09",
    "book_name": "1984",
    "balance": 5,
  },
  ...
]
```

#### Get a fine by id
This endpoint is only allowed for librarian to query one specific fine from the database.
```
GET /fines/:fineId

# Header
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "id": {fineId},
  "user_name": "John Doe",
  "email": "john@mail.com",
  "created_date": "2023-07-01",
  "due_date": "2023-07-15",
  "payment_date": null, # null if the fine is not paid yet
  "book_name": "Harry Potter and the Prisoner of Azkaban",
  "balance": 10,
}
```

#### Create a fine
This endpoint is used when the user does not return a book after the due date.
```
POST /fines

# Header
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "loan_id": 1,
}

# Response body
{
  "id": {fineId},
  "created_date": "2023-07-01",
  "due_date": "2023-07-15",
  "payment_date": null, # null if the fine is not paid yet
  "balance": 10,
  "loan_id": 1,
}
```

#### Update a fine
This endpoint is used when the user pays the fine.
```
PUT /fines/:fineId

# Header
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "loan_id": 1,
  "payment_date": "2023-07-09",
}

# Response body
{
  "id": {fineId},
  "created_date": "2023-07-01",
  "due_date": "2023-07-15",
  "payment_date": "2023-07-09",
  "balance": 10,
  "loan_id": 1,
}
```

#### Delete a fine
This endpoint is used by the librarian to delete a fine from the database.
```
DELETE /fines/:fineId

# Header
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "message": "Fine is deleted successfully"
}
```

### Review endpoints
#### Get all reviews from a book
```
GET /books/:bookId/reviews?startDate={start_date}&endDate={end_date}&sortBy={sorting-condition}&order={order}&perPage={results_per_page}&offset={offset}

# Response body
[
  {
    "id": "id",
    "user_name": "John Doe",
    "rating": 5,
    "comment": "This is a great book"
  },
  {
    "id": "id",
    "user_name": "Jane Doe",
    "rating": 4,
    "comment": "What a wonderful story!!!"
  },
  ...
]
```

#### Create a review
```
POST /books/:bookId/reviews

# Header
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "rating": 5,
  "comment": "This is a great book"
}

# Response body
{
  "id": 1,
  "rating": 5,
  "comment": "This is a great book",
  "book_id": {bookId},
  "user_id": {userId}, # user_id is taken from the token
}
```

#### Update a review
```
PUT /books/:bookId/reviews/:reviewId

# Header
{
  "Authorization": "Bearer {token}"
}

# Request body
{
  "rating": 5,
  "comment": "This is a great book"
}

# Response body
{
  "id": {reviewId},
  "rating": 5,
  "comment": "This is a great book",
  "book_id": {bookId},
  "user_id": {userId}, # user_id is taken from the token
}
```

#### Delete a review
```
DELETE /books/:bookId/reviews/:reviewId

# Header
{
  "Authorization": "Bearer {token}"
}

# Response body
{
  "message": "Review is deleted successfully"
}
```