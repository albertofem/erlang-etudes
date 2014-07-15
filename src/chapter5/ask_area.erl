-module(ask_area).
-author("albertofem").

-export([
  area/0
]).

-spec(area() -> number()).

area() ->
  Answer = hd(io:get_line('R) Rectangle, T) Triangle, E) Ellipse > ')),
  Shape = get_shape_from_string(Answer),
  Width = get_number_from_io('Enter width > '),
  Height = get_number_from_io('Enter height > '),
  Area = area(Shape, Width, Height),
  Area.

-spec(get_shape_from_string(string()) -> atom()).

get_shape_from_string(Shape) ->
  case Shape of
    $R -> rectangle;
    $T -> triangle;
    $E -> ellipse;
    true -> default
  end.

-spec(get_number_from_io(string()) -> integer()).

get_number_from_io(Prompt) ->
  IoData = io:get_line(Prompt),
  {Result, _} = string:to_float(IoData),
  case Result of
    error -> {Number, _} = string:to_integer(IoData);
    _ -> Number = Result
  end,
  Number.

-spec(area(atom(), number(), number()) -> number()).

area(Shape, Length, Width) when Length >= 0, Width >= 0 ->
  case Shape of
    rectangle -> Length * Width;
    triangle -> (Length * Width) / 2.0;
    ellipse -> math:pi() * Length * Width
  end.