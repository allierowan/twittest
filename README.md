# Twittest

Twittest was an Iron Yard homework assignment where we were tasked with building our own version of Twitter. Users can create posts, view a stream of all other users' posts and view a specific users' posts. They can also edit their own profile or password. Users log in with their username, which must be unique.

## Users
```ruby
legolas = User.create({
  email: "test@test.com",
  password: "password", # gets set using has_secure_password and bcrypt
  full_name: "Legolas",
  user_name: "blondie_elf"
  })
```

## Posts
Users have many posts and posts belong to user.
```ruby
post = Post.new({
  body: "A red sun rises, blood has been spilled this night."
  })

legolas.posts << post
legolas.save
```
