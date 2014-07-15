-module(stats).
-author("albertofem").

-export([
  minimum/1,
  minimum_if/1,
  maximum/1
]).

-spec(minimum(list()) -> number()).

minimum(List) ->
  [Head | Rest] = List,
  minimum(Rest, Head).

minimum([], Candidate) ->
  Candidate;
minimum([Head|Rest], Candidate) when Head < Candidate ->
  minimum(Rest, Head);
minimum([Head|Rest], Candidate) when Head >= Candidate ->
  minimum(Rest, Candidate).

-spec(minimum_if(list()) -> number()).

minimum_if(List) ->
  minimum_if(List, hd(List)).

minimum_if([], Candidate) ->
  Candidate;
minimum_if([Head|Rest], Candidate) ->
  if
    Head < Candidate -> minimum_if(Rest, Head);
    Head >= Candidate -> minimum_if(Rest, Candidate)
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