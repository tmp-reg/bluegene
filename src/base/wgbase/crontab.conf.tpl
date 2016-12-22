%%-----------------------------------------------------------------------------
%%
%% the cron tab running in erlang
%%
%% please see also crontab(5) : man 5 crontab
%%
%%  field               allowed values
%%  -----               --------------
%%  minute(m)           0-59
%%  hour(h)             0-23
%%  day of month(dom)   1-31
%%  month(mon)          1-12 
%%  day of week(dow)    0-7 (0 or 7 is Sun)
%%
%% the asterisk(*), which always stands for all the value , "first to last"
%%
%% ranges of number allowed, ranges are two number sperated with a hyphen(-),
%% the specified range is inclusive, for example, 8-11 for an 'hours' entry 
%% specifies excuation at hours 8, 9, 10 and 11. the ranges must be enclose with 
%% double quote "
%%
%% lists are allowed, A list is a set of nummbers( or ranges) seprated by commas, 
%% and all the list must encluse with doubel quote ", for example, "1,3,6-7"
%%  
%% the step value can be used in conjunction with ranges, following a range
%% with "/<number>" specifies the skips of the number's value through the range
%% for example, 0-23/2 in hours filed can spcify the command excuation every 
%% other hour(0,2,4,6,8,10,12,14,16,18,20,22)
%%  
%% Note:  The  day of a command's execution can be specified by two fields -- 
%% day of month, and day of week.  If both fields are restricted (i.e., aren't *), 
%% the command will be run when either field matches the current  time. 
%%
%% Format:
%%
%% {{m, h, dom, mon, dow}, {M, F, A}}
%% M:F(A) is excuted in a new erlang process
%%
%% Some exampls:
%%
%% {{0, 2, "*", "*", "*"}, {io, format, ["hello"]}}. 
%% print hello in hour 2 ervery day
%%
%% {{"0-59/2", "*", "*", "*", "*"}, {erlang, garbage, [whereis(user)]}}.
%% do the garbage collect on user process, every 2 minitues(0, 2, ..., 58) 
%%
%% Instead of the first five fields, one of eight special strings may appear:
%%               @yearly        Run once a year, "0 0 1 1 *".
%%               @monthly       Run once a month, "0 0 1 * *".
%%               @weekly        Run once a week, "0 0 * * 0".
%%               @daily         Run once a day, "0 0 * * *".
%%               @hourly        Run once an hour, "0 * * * *".
%% 
%% example:
%%  {"@daily", {io, format, ["hello"]}}.
%%
%%-----------------------------------------------------------------------------

% demo, say hello ervery minitues 
{{"*", "*", "*", "*", "*"}, {io, format, ["hello"]}}.

% do the rank calc in 2 clock of every day
{{"*", "*", "*", "*", "*"}, {tldh_rank_calc, calc_ranks, []}}.

% do the sysdata import in every hour
{{0, "*", "*", "*", "*"}, {tldh_sysdata_server, cron_import_data, []}}.

% do the delete old tax history work
{{"*", "*", "*", "*", "*"}, {tldh_user, del_old_tax_histories, []}}.
