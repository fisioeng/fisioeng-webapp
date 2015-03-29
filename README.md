# Fisioeng - Web Application

Hello! It's alright?
We'll speak just to many about this free software that hope help the world. Yeah, we want that! But how do we think to make this with a simple software? This is the biggest problems that we want to attack with our simple solution.
The animals got to dead every day to give us the insane to our hunger greedy of meat (not me, rs)  and the process to feed this is a big system of confinement. This system may to be cruel, making the animals spend all the life suffering and unable to express in a natural way.
Our solution is give to the peoples a tool to know if the animals is alright, if they are expressing the normal condition of its life. Its a little step, but we have to walk..

As well, we want to help the academic area that haven't an tool to make they studies of animal behaviors. It can help they to create new process to solve the first question.
This tool solves too the problems of academic (or not academic) that want to analyse any analyte, giving to him a abstract system to calculate statical values to give to him a good improvements to make a good choise.

With fisioeng will be possible to make a "animal traceability", to know how was all his life.

And know that you know what we do, you can contribute with this project.

* What is the version of Ruby? Ruby 2.0.0
 We develop this application with the version 2.0.0 of Ruby and we use the rvm to manage this with gemsets. 
 You can do this with the commands:

<tt>source /home/youruse/.rvm/scripts/rvm </tt>

<tt>rvm use 2.0.0@fisioeng --create </tt>

The second command create a new gemset to you, but if you already have it, the rvm will only switch to the gemset fisioeng and ignore the parameter --create.

* Or system dependencies
 The dependencies of project is, of course, Gemfile and in bower file.
 Our main dependency are:
 #### Ruby
  * rails 4.2.1
  * devise
  * activeadmin
  * mysql2
  * bower-rails

 #### Javascript and css
  * AngularJs 1.3.*
  * Bootstrap 3.*

* Database
 To create the database and with our seeds, run rake as:

<tt>rake db:create</tt>
<tt>rake db:migrate</tt>
<tt>rake db:seed</tt>

* Development instructions

 To contribute with the fisioeng project you has to fork the repo and submit pull requests. 
 In branch master we have approved issues and minimum stable version. In upstream we have approved taks but don't ready create an new version. The develop branch is use by the team to up new fixtures in development process.
 
 Make the instructions of Ruby version and run
 <tt>bundle install</tt>
 This will install the dependencies in gemset.
 
 After you will need to run the commands in Database section.
 
 If all goes well, install the bower dependencies using rake:
 <tt>rake bower:install</tt>

 And know you can run the application in built in mode:
 <tt>rails server/tt>
 
 Access the addres http://localhost:3000 and the system will appear to you.

# TODO
 ### Active admin
  * The style of active admin must to be the same of remainder of system
  * The use form has to be fixed
  * Config system variables
  * Create a seed to active admin user

 ### Routes to measure's graph:
  * Provide data as json with granularity and time filter.
  * Make the router process N graph series

 
