# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
                  { title: 'Ruby' },
                  { title: 'Rails'},
                  { title: 'Postgres'}
                ])

Test.create([
              { title: 'Ruby blocks', level: 3, category_id: 1 },
              { title: 'Ruby classes', level: 3, category_id: 1 },
              { title: 'Rails Models', level: 5, category_id: 2 },
              { title: 'Rails Views', level: 6, category_id: 2 },
              { title: 'Rails Controllers', level: 4, category_id: 2 },
              { title: 'Postgres essentials', level: 3, category_id: 3 },
              { title: 'Postgres SQL essentials', level: 4, category_id: 3 }
            ])

Question.create([
                  { body: 'How to define ruby block?', test_id: 1 },
                  { body: 'How to define a class?', test_id: 2 },
                  { body: 'Where is Rails models placed?', test_id: 3 },
                  { body: 'Where is Rails views placed?', test_id: 4},
                  { body: 'Where is Rails controllers places?', test_id: 5 },
                  { body: 'What is Postgres?', test_id: 6 },
                  { body: 'How to select all attributes from table?', test_id: 7 }
                ])

Answer.create([
                { body: 'With a "&" sign.', question_id: 1 },
                { body: 'With a "do ... end" construction.', question_id: 1 },
                { body: 'With a "define" construction.', question_id: 2 },
                { body: 'With a "class" construction.', question_id: 2 },
                { body: 'In "schema.rb" file.', question_id: 3 },
                { body: 'In "models" directory.', question_id: 3 },
                { body: 'In "application.rb" file.', question_id: 4 },
                { body: 'In "views" directory.', question_id: 4 },
                { body: 'In "application_controller.rb" file.', question_id: 5 },
                { body: 'In "controllers" directory.', question_id: 5 },
                { body: 'It is a ORM for Rails', question_id: 6 },
                { body: 'It is an relational database system.', question_id: 6 },
                { body: 'SELECT * FROM table_name', question_id: 7 },
                { body: 'SELECT all FROM table_name', question_id: 7 }
              ])

User.create([
              { name: 'Andrew', password: '123456'},
              { name: 'Admin', password: 'admin'}
            ])