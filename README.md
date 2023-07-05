# Teamwork
Designing REST API endpoints and database schema

## Topic
This assigment requires teamwork. Your team can pick one from two topics: 
1. Library management system
2. Ecommerce platform
---
## Requirements
*For team assignment, only 1 member in the team should fork the repo. Then, admin can invite other members to contribute in the same repo. Remember to have develop branch before merging to main. Each feature/schema/bug/issue should have it's own branch, and 1 branch/file edition should be taken by only 1 member at a time. Before making any new branch, make sure you sync the fork and run `git pull` to avoid the conflicts with the parent repo. If neccessary, check the Git lecture again.*
1. Create ERD diagram with proper entities, attributes, and relationship. The ERD can be added to the project as image.
2. Design the API endpoints, following REST API architecture. The endpoints can be displayed as text with detail explaination. 

For example:
```
Products API
Base URL: https://example.com/api/v1/products
- Get all products: [GET] `/`
  Query Parameters
  * sort (string, optional): Sort the products based on a specific field. Accepted values: name, price, created_at, updated_at.
  * search (string, optional): Search for products by name or description.
  * page (integer, optional): The page number for pagination.
  * limit (integer, optional): The maximum number of products to include per page.
- Get a product by id: [GET] `/:productId`
- Create a product: [POST]: `/`
  Example Request Body:
  {
  "name": "New Product",
  "price": 39.99,
  "description": "This is a new product"
  }
```
4. Provide PostgreSQL queries for the basic CRUD operations
