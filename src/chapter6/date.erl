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

julian(Year, Month, Day, DaysPerMonth, Total) ->
  ListLength = length(DaysPerMonth),
  [CurrentMonth|RestOfMonths] = DaysPerMonth,
  IsLapYear = is_leap_year(Year),
  Position = 13-ListLength,
  IsFebruaryInLeapYear = (Month == 2 andalso IsLapYear),
  if
    IsFebruaryInLeapYear -> NewTotal = Total+CurrentMonth-Day+1;
    Position < Month -> NewTotal = Total+CurrentMonth;
    Position == Month -> NewTotal = Total+CurrentMonth-Day
  end,
  case Position == Month of
    true -> Total;
    false -> julian(Year, Month, Day, RestOfMonths, NewTotal)
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

