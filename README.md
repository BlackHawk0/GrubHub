# README

## Description

Kibandaski is a web application that allows users to order meals and pay for them at the comfort of their homes. The web application makes use of Daraja API to make payments

## LIVE LINKS
API LINK: https://grub-hub.onrender.com

SITE LINK : https://book-a-meal-cd2fb.web.app/

### Deployed endpoints
```sh
POST /register
POST /login
GET /profile
POST /stkpush
POST /stquery
POST /favourites
GET /favourites
POST /orders
GET /orders
GET /history
GET /categories
POST /categories
PATCH /categories
GET /meals
POST /meals
PATCH /meals
```

### Features

1. Users can create an account and log in 
2. Admin (Caterer) is able to manage (i.e: add, modify and delete) meal options in the application. 
3. Admin (Caterer) is able to set up a menu for a specific day by selecting from the meal options available on the system. 
4. Authenticated users are able to see the menu for a specific day and select an option out of the menu. 
5. Authenticated users are able to change their meal choice. 
8. Admin is able to see the orders made by the user 

### Technologies

Backend: Ruby on Rails
Database: PostgreSQL
Frontend: Reactjs
Testing: rspec

## Setup
### Presequites

1. Sign up to [Daraja API](https://developer.safaricom.co.ke/) and create and APP
2. Download [ngrok](https://ngrok.com/)
3. Have ruby installed
4. Have postgres installed
5. Have nodejs installed
## Backend

1. Clone this repository
```
git clone https://github.com/BlackHawk0/GrubHub.git
```
2. Run bundle install to install all the dependencies
```
bundle install
```
3. Run rails db:create db:migrate to create and migrate the database
```
rails db:drop db:create db:migrate db:seed
```
4. Run rails server to start the development server
```
rails s
```

## Sample register
```js
axios
    .post("http://127.0.0.1:3000/register", {
      email: user.email,
      username: user.username,
      password: user.password,
      role: "customer"
    })
    .then((response) => {
      localStorage.setItem("token", response.data.jwt);
      // redirect to the profile page
      navigate("/");
    })
    .catch((error) => {
      if (error.response) {
        setErrors(error.response.data.errors);
      } else {
        setErrors(["Something went wrong, please try again later"]);
      }
    });
```
## sample response

```json
{
    "user": {
        "id": 1,
        "email": "test@store.com",
        "username": "test",
        "password_digest": "$2a$12$zs.z1a1KcOMzopaC9ywo/u/uUihhBuyHPEemAgYwdSjVNvM1.cFTS",
        "role": "customer",
        "created_at": "2023-01-23T04:46:10.348Z",
        "updated_at": "2023-01-23T04:46:10.348Z"
    },
    "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.EAZcKeVxqw2FGBrZG9UoEaVVCVCDClVHai87_1XUG1Q"
}

```
## Authors
- [BlackHawk0](https://www.github.com/BlackHawk0)
- [jasonkiptoo](https://github.com/jasonkiptoo)

## Contributing

Bug reports and pull requests are welcome on GitHub at [isues](https://github.com/BlackHawk0/GrubHub/issues). This project is intended to be a safe, welcoming space for collaboration.
## License

This project is [MIT License](https://opensource.org/licenses/MIT) Lincensed.