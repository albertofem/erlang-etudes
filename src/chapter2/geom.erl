-module(geom).
-author("albertofem").

-export([
  area/2
]).

-spec(area(number(), number()) -> number()).

area(Length, Width) ->
  Length * Width.