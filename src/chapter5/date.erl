-module(date).
-author("albertofem").

%% API
-export([
  date_parts/1
]).

-spec(date_parts(list()) -> list()).

date_parts(DateIso) ->
  [YearStr, MonthStr, DayStr] = re:split(DateIso, "-", [{return, list}]),
  {Year, _} = string:to_integer(YearStr),
  {Month, _} = string:to_integer(MonthStr),
  {Day, _} = string:to_integer(DayStr),
  [Year, Month, Day].
