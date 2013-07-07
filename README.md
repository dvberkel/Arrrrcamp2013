Arrrrcamp 2013 [![Build Status](https://travis-ci.org/dvberkel/Arrrrcamp2013.png?branch=master)](https://travis-ci.org/dvberkel/Arrrrcamp2013)
==============

A compendium repository to the [Arrrrcamp 2013][arrrrcamp] presentation

> Pirate Power Play: How to do computation by playing games
>
> Every pirate likes to play games. Whether to pass the time during
> long sea voyages or entertain fellow pirates around the drinking
> table, games are a wonderful pastime. Unfortunately the captain does
> not always understand. Would it not be great to have a proper defense
> when the captain scolds you for idling away time? This talk will
> provide you with enough gun powder to counter any attack your captain
> launches on you for playing games on deck.
>
> We will dive into the seven seas of computational complexity and
> discuss a uniform means of understanding them: games! We show that
> playing games corresponds to certain types of computations. And as
> every captain knows, before finding the treasure you have to compute
> where X marks the spot.
>
> We will use ruby to demonstrate the correspondence between
> computations and games by creating specific games that perform
> certain computations and playing them life.

Usage
-----

We use [rvm][] to manage our ruby versions and gemsets. The project
contains a `.rvmrc` file to change environment upon entering the
working directory.

We use [bundler][] to manage our dependencies. It can be installed
with

```shell
gem install bundler
```

After that dependencies can be installed with the `bundle install`
command. Note that it references the `gemspec` file.

We use [rake][] to automate various tasks in the project.

### Testing

We use [rspec][] to specify the behaviour of our code.

```shell
rake spec
```

The command above will run all specifications. Quit incidentally this
is the default task so it suffices to just run `rake`.

Progress
--------

Want to know where I am working on? See the [Trello board][trello].

[arrrrcamp]: http://arrrrcamp.be/
[trello]: https://trello.com/board/arrrrcamp2013/51d8f6ce786f13dd240087b1
[rvm]: https://rvm.io/
[bundler]: http://bundler.io/
[rake]: http://rake.rubyforge.org/
[rspec]: http://rspec.info/