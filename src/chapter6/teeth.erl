-module(teeth).
-author("albertofem").

-export([
  alert/1
]).

-spec(alert(list()) -> list()).

alert(PocketDepths) ->
  alert(PocketDepths, 1, []).

-spec(alert(list(), number(), list()) -> list()).

alert([], _, Result) ->
  Result;
alert([ToothToCheck|RestOfTooths], ToothNumber, Result) ->
  case maximum(ToothToCheck) >= 4 of
    true -> alert(RestOfTooths, ToothNumber + 1, Result ++ [ToothNumber]);
    false -> alert(RestOfTooths, ToothNumber + 1, Result)
  end.

-spec(maximum(list()) -> number()).

maximum(List) ->
  maximum(List, hd(List)).

maximum([], Candidate) ->
  Candidate;
maximum([Head|Tail], Candidate) when Head >= Candidate ->
  maximum(Tail, Head);
maximum([Head|Tail], Candidate) when Head < Candidate ->
  maximum(Tail, Candidate).
