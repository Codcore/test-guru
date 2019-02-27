# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
                               { title: 'Ruby' },
                               { title: 'Rails' },
                               { title: 'Postgres' }
                             ])

tests = Test.create([
                      { title: 'Ruby blocks', level: 3, category: categories[0] },
                      { title: 'Ruby classes', level: 3, category: categories[0] },
                      { title: 'Rails Models', level: 5, category: categories[1] },
                      { title: 'Rails Views', level: 6, category: categories[1] },
                      { title: 'Rails Controllers', level: 4, category: categories[1] },
                      { title: 'Postgres essentials', level: 3, category: categories[2] },
                      { title: 'Postgres SQL essentials', level: 4, category: categories[2] }
                    ])

questions = Question.create([
                  { body: 'How to define ruby block?', test: tests[0] },
                  { body: 'How to define a class?', test: tests[1] },
                  { body: 'Where is Rails models placed?', test: tests[2] },
                  { body: 'Where is Rails views placed?', test: tests[3] },
                  { body: 'Where is Rails controllers places?', test: tests[4] },
                  { body: 'What is Postgres?', test: tests[5] },
                  { body: 'How to select all attributes from table?', test: tests[6] }
                ])

Answer.create([
                { body: 'With a "&" sign.', question: questions[0] },
                { body: 'With a "do ... end" construction.', question: questions[1] },
                { body: 'With a "define" construction.', question: questions[2] },
                { body: 'With a "class" construction.', question: questions[3] },
                { body: 'In "schema.rb" file.', question: questions[4] },
                { body: 'In "models" directory.', question: questions[5] },
                { body: 'In "application.rb" file.', question: questions[6] },
                { body: 'In "views" directory.', question: questions[7] },
                { body: 'In "application_controller.rb" file.', question: questions[8] },
                { body: 'In "controllers" directory.', question: questions[9] },
                { body: 'It is a ORM for Rails', question: questions[10] },
                { body: 'It is an relational database system.', question: questions[11] },
                { body: 'SELECT * FROM table_name', question: questions[12] },
                { body: 'SELECT all FROM table_name', question: questions[13] }
              ])

User.create([
              { name: 'Andrew', password: '123456' },
              { name: 'Admin', password: 'admin' }
            ])
