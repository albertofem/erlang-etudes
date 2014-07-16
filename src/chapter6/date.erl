-module(date).
-author("albertofernandez").

-export([
  julian/1
]).

-spec(julian(string()) -> string()).

julian(Date) ->
  DaysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
  [Year, Month, Day] = date_parts(Date),
  julian(Year, Month, Day, DaysPerMonth, 0).

-spec(julian(number(), number(), number(), list(), number()) -> number()).

julian(Year, Month, Day, DaysPerMonth, Total) when Month > 13 - length(DaysPerMonth) ->
  [CurrentMonth|RestOfMonths] = DaysPerMonth,
  julian(Year, Month, Day, RestOfMonths, Total + CurrentMonth);
julian(Year, Month, Day, _, Total) ->
  case Month > 2 andalso is_leap_year(Year) of
    true -> Total + Day + 1;
    false -> Total + Day
  end.

-spec(is_leap_year(number()) -> boolean()).

is_leap_year(Year) ->
  (Year rem 4 == 0 andalso Year rem 100 /= 0)
  orelse (Year rem 400 == 0).

-spec(date_parts(string()) -> list()).

date_parts(DateIso) ->
  [YearStr, MonthStr, DayStr] = re:split(DateIso, "-", [{return, list}]),
  {Year, _} = string:to_integer(YearStr),
  {Month, _} = string:to_integer(MonthStr),
  {Day, _} = string:to_integer(DayStr),
  [Year, Month, Day].

