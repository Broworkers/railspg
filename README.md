# RailsPG

Do you like Rails? Do you like RPG? Now you can have both!

## Installing it

0. Get ruby-1.9.3-p194

1. Get the code:

  ```bash
  git clone git@github.com:railsrumble/r12-team-508.git railspg
  ```

2. Install libraries

  ```bash
  cd railspg
  bundle
  ```

## Starting application

1. Start mongo:

  ```bash
  mkdir -p tmp/mongo
  mongod --dbpath tmp/mongo
  ```

2. Start rails application server

  ```bash
  rails s
  ```

3. Play it!

  ```bash
  open http://localhost:3000
  ```
