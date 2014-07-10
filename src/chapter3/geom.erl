-module(geom).
-author("albertofem").

-export([
  area/3,
  area/1
]).

-spec(area(atom(), number(), number()) -> number()).

area(rectangle, Length, Width) when Length >= 0, Width >= 0 ->
  Length * Width;
area(triangle, Length, Width) when Length >= 0, Width >= 0 ->
  (Length * Width) / 2.0;
area(ellipse, Length, Width) when Length >= 0, Width >= 0 ->
  math:pi() * Length * Width;
area(_, _, _) ->
  0.

area({Shape, Length, Width}) ->
  area(Shape, Length, Width).