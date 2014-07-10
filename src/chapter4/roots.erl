-module(roots).
-author("albertofem").

-import(powers, [
  raise/2
]).

-export([
  nth_root/2
]).

%%% 4.5

-spec(nth_root(number(), number()) -> number()).

nth_root(X, N) -> nth_root(X, N, X / 2.0).

-spec(nth_root(number(), number(), number()) -> number()).

nth_root(X, N, Approx) ->
  io:format('Current guess is ~f~n', [Approx]),
  F = raise(Approx, N) - X,
  Fprime = N * raise(Approx, N-1),
  NextApprox = Approx - F / Fprime,
  Change = abs(NextApprox-Approx),
  if
    Change < 1.0e-8 -> NextApprox;
    true -> nth_root(X, N, NextApprox)
  end.