# README

API LINK: https://grub-hub.onrender.com

Deployed endpoints
```sh
POST /register
POST /login
GET /profile
```
### Presequites
Make sure you've registered and logged in.
If ou are using postman make sure you add Authorization header and a bearer token from the jwt authentication

## sample
```js
fetch('https://grub-hub.onrender.com/profile')
  .then(res => res.json)
  .then(data => console.log(data))
```
