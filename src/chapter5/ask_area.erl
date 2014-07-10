-module(ask_area).
-author("albertofem").

-import(geom, [
  area/3
]).

-export([
  area/0
]).

-spec(area() -> number()).

area() ->
  Answer = io:get_line('R) Rectangle, T) Triangle, E) Ellipse'),
  Shape = get_shape_from_string(Answer).

-spec(get_shape_from_string(string()) -> atom()).