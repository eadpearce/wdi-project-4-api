# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Prompt.destroy_all
Tag.destroy_all
Fill.destroy_all
Comment.destroy_all

# create anonymous user and dummy users
User.create!({
  username: "anonymous",
  email: "anon@anon.com",
  password: "password",
  password_confirmation: "password",
  about: "I am one. I am many."
  })
klyn = User.create!({
  username: "klyn",
  email: "klyn@klyn.com",
  password: "password",
  password_confirmation: "password"
  })
kenji = User.create!({
  username: "kenji",
  email: "kenji@kenji.com",
  password: "password",
  password_confirmation: "password"
  })
neku = User.create!({
  username: "neku",
  email: "neku@neku.com",
  password: "password",
  password_confirmation: "password"
  })

# make some prompts and comments
prompt1 = Prompt.create!({
  title: "FFXV Modern AU, Gen",
  rating: "general",
  body: "The cast of FFXV in a police procedural. Go.",
  user_id: klyn.id
  })
klyn.prompts << prompt1
prompt1.comments.create!({
  body: "yes pls",
  prompt_id: prompt1.id,
  user_id: kenji.id
  })
prompt1.comments.create!({
  body: "seconded",
  prompt_id: prompt1.id,
  user_id: neku.id
  })
prompt2 = Prompt.create!({
  title: "This is a prompt with a very very very long title",
  body: "Alien and Star Trek crossover. I want Data to fight David 8.",
  rating: "mature",
  user_id: kenji.id
  })
kenji.prompts << prompt2
prompt2.comments.create!({
  body: "omg",
  prompt_id: prompt2.id,
  user_id: klyn.id
  })
prompt2.comments.create!({
  body: "what!!!!",
  prompt_id: prompt2.id,
  user_id: neku.id
  })

# add some tags to prompt
tag1 = Tag.create!({ name: "ffxv" })
tag2 = Tag.create!({ name: "modern au" })
prompt1.tags << tag1
prompt1.tags << tag2

fill1 = Fill.create!({
  prompt_id: prompt1.id,
  user_id: kenji.id,
  title: "FFXV Modern AU",
  rating: "teen",
  body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  })
fill1.tags << tag1
fill1.tags << tag2

fill2 = Fill.create!({
  prompt_id: prompt1.id,
  user_id: kenji.id,
  title: "FFXV Modern AU, pt.2",
  rating: "mature",
  body: "Another fill. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  })
fill2.tags << tag1
fill2.tags << tag2
prompt1.fills << fill1
prompt1.fills << fill2
