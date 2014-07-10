
-module(powers).
-author("albertofem").

-export([
  raise/2,
  raise_if/2
]).

-spec(raise(number(), number()) -> number()).

raise(_, 0) ->
  1;
raise(N, 1)
  -> N;
raise(X, N) when N > 0 ->
  X * raise(X, N-1);
raise(X, N) when N < 0 ->
  1 / raise(X, -N).

-spec(raise_if(number(), number()) -> number()).

raise_if(X, N) ->
  if
    N == 0 -> 1;
    N == 1 -> X;
    N > 0 -> X * raise(X, N-1);
    N < 0 -> 1.0 / raise(X, -N)
  end.
