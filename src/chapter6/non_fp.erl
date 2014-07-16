-module(non_fp).
-author("albertofem").

-export([
  generate_teeth/2,
  test_teeth/0
]).

-spec(generate_teeth(string(), number()) -> list()).

generate_teeth(Teeths, Probability) ->
  random:seed(now()),
  generate_teeth(Teeths, Probability, []).

-spec(generate_teeth(list(), number(), list()) -> list()).

generate_teeth([], _, TeethList) -> TeethList;
generate_teeth([$T | Tail], Probability, TeethList) ->
  generate_teeth(Tail, Probability, TeethList ++ generate_tooth(Probability));
generate_teeth([$F | Tail], Probability, TeethList) ->
  generate_teeth(Tail, Probability, TeethList ++ [0]).

-spec(generate_tooth(number()) -> list()).

generate_tooth(Probability) ->
  Random = random:uniform(),
  if
    Random < Probability -> BaseDepth = 2;
    true -> BaseDepth = 3
  end,
  generate_tooth(BaseDepth, 6, []).

-spec(generate_tooth(number(), list(), list()) -> list()).

generate_tooth(_, 0, DataList) -> DataList;
generate_tooth(BaseDepth, TeethsLeft, DataList) ->
  Random = random:uniform(3) - 2 + BaseDepth,
  Data = DataList ++ [Random],
  generate_tooth(BaseDepth, TeethsLeft-1, Data) ++ Data.

test_teeth() ->
  TList = "FTTTTTTTTTTTTTTFTTTTTTTTTTTTTTTT",
  N = generate_teeth(TList, 0.75),
  print_tooth(N).

print_tooth([]) -> io:format("Finished.~n");
print_tooth([H|T]) ->
  io:format("~p~n", [H]),
  print_tooth(T).