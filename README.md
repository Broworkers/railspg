# RailsPG

Do you like Rails? Do you like tabletop RPG? Now you can have both!

## Installing it

1. Get ruby-1.9.3-p194

2. Get the code

  ```bash
  git clone git@github.com:railsrumble/r12-team-508.git railspg
  ```

3. Install the libraries

  ```bash
  cd railspg
  bundle
  ```

4. You can create extra users using the console

  ```bash
    rails c
  ```

  ```ruby
    User.create(email: 'funny@example.com')
  ```


## Starting the application

1. Start mongo

  ```bash
  mkdir -p tmp/mongo
  mongod --dbpath tmp/mongo
  ```

2. Start Rails application server

  ```bash
  rails s
  ```

3. Play it!

  ```bash
  open http://localhost:3000
  ```
