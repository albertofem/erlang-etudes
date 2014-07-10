-module(geom).
-author("albertofem").

-export([
  area/3
]).

-spec(area(atom(), number(), number()) -> number()).

area(Shape, Length, Width) when Length >= 0, Width >= 0 ->
  case Shape of
    rectangle -> Length * Width;
    triangle -> (Length * Width) / 2.0;
    ellipse -> math:pi * Length * Width
  end.