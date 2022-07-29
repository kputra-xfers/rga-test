# README

* Ruby Version: 3.1.2
* Rails Version: 7.0.3.1
* DB: PostgreSQL

## First configuration
1. Clone directory
```
$ git clone git@github.com:kputra-xfers/rga-test.git
```

2. Move to directory
```
$ cd rga-test
```

3. Install library
```
$ gem install bundler
$ bundle install
```

4. Create, migrate, and seed database
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## Run the apps

1. Run the server
```
$ rails s
```

2. In your browser, set address to `http://localhost:3000`

## Running rspec

```
$ rspec
```