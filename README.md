# Fisioeng - Web Application

Hello! It's alright?

We'll speak just to many about this free software that hope help the world. Yeah, we want that! But how do we think to make this with a simple software? This is the biggest problems that we want to attack with our simple solution.
The animals got to dead every day to give us the insane to our hunger greedy of meat (not me, rs) and the process to feed this is a big system of confinement. This system may to be cruel, making the animals spend all the life suffering and unable to express in a natural way.
Our solution is give to the peoples a tool to know if the animals is alright, if they are expressing the normal condition of its life. Its a little step, but we have to walk.

As well, we want to help the academic area that haven't an tool to make they studies of animal behaviors. It can help they to create new process to solve the first question.
This tool solves too the problems of academic (or not academic) that want to analyse any analyte, giving to him a abstract system to calculate statical values to give to him a good improvements to make a good choise.

With fisioeng will be possible to make a "animal traceability", to know how was all his life.

And know that you know what we do, you can contribute with this project.

## Requeriments

- [Ruby](https://www.ruby-lang.org/en/)
- [RVM](https://rvm.io/)

We develop this application with Ruby the 2.0.0 and we use the rvm to manage this with gemsets.

## Dependencies

The project dependencies are, of course, in Gemfile and in bower file.
Our main dependencies are:

- Ruby
  - rails 4.2.1
  - devise
  - activeadmin
  - mysql2
  - bower-rails

- JavaScript and css**
  - AngularJs 1.3.*
  - Bootstrap 3.*

## Configuration

After you [install](https://rvm.io/rvm/install) and [configure](https://rvm.io/rvm/basics) the RVM, run the below command to create a new gemset:

```
$ rvm use 2.0.0@fisioeng --create
```

Make the instructions of Ruby version and run `bundle install` to install the dependencies in gemset.

### Database

Rename the config/database.yml.dist to config/database.yml and change the username and password in development, test and production database config.

```
username: your_database_username
password: super_secret_password
```

To create the database and with our seeds, run rake as:

```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

If you are using any debian distribution you have to install this dependencies:

```
$ sudo apt-get install libmysql-ruby libmysqlclient-dev
```

### Bower

Install the bower dependencies using rake:

```
rake bower:install
```

## Running

Run the application in built in mode:

```
rails server
```

Access the address [http://localhost:3000](http://localhost:3000) in your browser and the system will appear for you.
The default username is 'obama@email.com' and the password is 'obama123'.

## Contributing

- To contribute with the fisioeng project you has to fork the repo and submit pull requests.

### Branch workflow:
- master: approved issues and minimum stable version
- upstream: approved tasks but don't ready create an new version
- develop: use by the team to up new fixtures in development process

## TODO

### Active admin

- The style of the current admin should to be the same of remainder of system
- The use form has to be fixed
- Config system variables
- Create a seed to active admin user

### Routes to measure's graph
- Provide data as json with granularity and time filter.
- Make the router process N graph series
