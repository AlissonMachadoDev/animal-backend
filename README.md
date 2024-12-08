# AnimalBackend

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


# TO DO
* recreate this README
* work with tests
* documentate the game flow


## Early gameflow characteristics
The gameflow consists in
1. the user is authenticated
2. he starts a match
3. the user need to starts a set
4. the system choose who's gonna start, if is gonna be the opponent, the result will be with the opponent card
   1. If the user is who gonna starts, he needs to select 1 of the 3 sorted cards for this match, when he selects, the system will create an opponent movement too.
   2. doesn't matter who started, the system will compairs who's have the card with the biggest value, and choose the user to win this set.
5. There's a few rules to understand who wins, the first that happens, will gonna be choosed.
   1. If the same user win 2 sets.
   2. If a set is draw, the first that won will be the winner.
   3. 