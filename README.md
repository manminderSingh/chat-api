
# Rails ChatApp Api

* Ruby version - 2.6.0

* Rails version - 6.1.3

## Instructions to run this app



1. Clone the repository using the following command:

      ```
      $ git clone git@github.com:manminderSingh/chat-api.git
      ```

2. Once donwloaded, run bundle install

      ```
      $ bundle install
      ```

3. Make sure if you have credentials.yml.enc file, please delete that to create a new one using the following command. Also, running this command would generate a master.key which would be gitignored

      ```
      $ EDITOR="mate --wait" bin/rails credentials:edit
      ```


4. Run the migrate command to create database for the development and test respectively
  
      a. Development db migration

      ```
      $ rails db:migrate RAILS_ENV=development
      ```

      b. Test db migration (For Test Cases)

      ```
      $ rails db:migrate RAILS_ENV=test
      ```

5. Run the rails app using the following command.

      ```
      $ rails s
      ```

## Almost there

* Before you move on, please install Redis from https://redis.io/topics/quickstart for the application to run correctly. Command to run the Redis server after successful installation using the above link.

      ```
      $ redis-server
      ```

## Running Test Cases

1. If you have already migrated the test database in the installation phase, please skip this step. To migrate the test database, run the following command.

      ```
      $ rails db:migrate RAILS_ENV=test
      ```

2. After runnning the above command either at the start or just before this step, please run the following command to run the tese suite.

      ```
      $ rails spec  OR  $ rspec
      ```
