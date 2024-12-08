# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AnimalBackend.Repo.insert!(%AnimalBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias AnimalBackend.GameStructure

GameStructure.create_card(%{
  name: "Dog",
  description: "Just a dog",
  value: 1,
  image_url: "image"
})

GameStructure.create_card(%{
  name: "Cat",
  description: "Just a cat",
  value: 2,
  image_url: "image"
})

GameStructure.create_card(%{
  name: "Cow",
  description: "Just a cow",
  value: 3,
  image_url: "image"
})

GameStructure.create_card(%{
  name: "Lion",
  description: "Just a lion",
  value: 4,
  image_url: "image"
})

GameStructure.create_card(%{
  name: "Guepard",
  description: "Just a guepard",
  value: 5,
  image_url: "image"
})

GameStructure.create_card(%{
  name: "shark",
  description: "Just a shark",
  value: 6,
  image_url: "image"
})
