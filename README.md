# RailsPG

Do you like Rails? Do you like tabletop RPG? Now you can have both!


## Installation

Install ruby-1.9.3-p194.

Get the code:

```bash
git clone git@github.com:current/railspg.git
```

Install the libraries:

```bash
cd railspg
bundle
```

You can create extra users using the console:

```bash
rails c
```

```ruby
User.create(email: 'funny@example.com')
```


## Starting

Start Mongo:

```bash
mkdir -p tmp/mongo
mongod --dbpath tmp/mongo
```

Start Rails application server:

```bash
rails s
```

Gather some friends and have fun:

```bash
open http://localhost:3000
```
