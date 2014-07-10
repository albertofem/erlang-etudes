-module(djisktra).
-author("albertofem").

-export([
  gcd/2,
  gcd_if/2
]).

-spec(gcd(number(), number()) -> number()).

gcd(A, B) when A == B ->
  A;
gcd(A, B) when A > B ->
  gcd(A-B, B);
gcd(A, B) when A < B ->
  gcd(A, B-A).

-spec(gcd_if(number(), number()) -> number()).

gcd_if(A, B) ->
  if
    A == B -> A;
    A > B -> gcd(A-B, B);
    true -> gcd(A, B-A)
  end.
