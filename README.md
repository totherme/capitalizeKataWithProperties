# capitalizeKata -- attempting a property-driven approach

This repo contains an attempt at a property-driven approach at the
capitalize kata, in haskell. Follow the commits to see how it went.

I used hspec to arrange my tests (as if I were doing regular TDD), but
attempted to write only relatively general properties, and no
single-point tests. Whether this is a good thing to do or not is an
open question.

## 2025-02-13 Updated to work on ARM mac machines

Back when I originally wrote this stuff, macbooks didn't have ARM chips
in them, and so ghc didn't build for darwin/arm. Today I edited this
repo's initial commit to use a newer haskell toolchain which *does*
build on modern macs. And I rebased all this repos other commits on top
of that change.

This means that if you want to follow along with the exercise, you can
check out any commit you like and it should work on a modern machine.
As a side-effect, it means that all the work looks like it was done
today, instead of 8 years ago.

If for some reason you want to look at the original commits, look at
the branch `original-main-does-not-work-on-recent-macs`.
