Conway's Game of Life in Ruby
=============================

Using no conditionals and on a torus.

Implemented at the Mississauga Code Retreat on June 9th in a 45-minute session.

Usage
-----

Spin up `irb` from the project's directory then:

    require "./board"

    b = Board.new 50, 50

    # Use b.next_generation to calculate the next generation
    b.next_generation

    # Use b.pretty_print to display the current generation
    b.pretty_print

    # Use b.pretty_print_next_generation (or b.ppng for short) to calculate the next generation then pretty print it
    b.ppng

TODO
----

A better way of displaying the cells. Possibly ncurses.