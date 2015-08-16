# RailsPG

Do you like Rails? Do you like tabletop RPG? Now you can have both!


## Installation

1. Get ruby-1.9.3-p194

2. Get the code

```bash
git clone git@github.com:current/railspg.git
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


## Starting

1. Start mongo

```bash
mkdir -p tmp/mongo
mongod --dbpath tmp/mongo
```

2. Start Rails application server

```bash
rails s
```

3. Gather some friends and have fun!

```bash
open http://localhost:3000
```
