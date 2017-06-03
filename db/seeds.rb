# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Prompt.destroy_all
# Tag.destroy_all
# Fill.destroy_all

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
prompt = Prompt.create!({
  title: "Modern AU, Gen",
  body: "The cast of FFXV in a police procedural. Go.",
  user_id: klyn.id
  })
klyn.prompts << prompt
tag1 = Tag.create!({ name: "ffxv" })
tag2 = Tag.create!({ name: "modern au" })
tag3 = Tag.create!({ name: "gen" })
prompt.tags << tag1
prompt.tags << tag2
prompt.tags << tag3

fill = Fill.create!({
  prompt_id: prompt.id,
  user_id: kenji.id,
  body: "This is a fill"
  })
prompt.fills << fill
