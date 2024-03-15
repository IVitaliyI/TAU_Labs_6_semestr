concat = [v, t];

columns = {'x','y','z','t'}

table = array2table(concat, 'VariableNames',columns);
writetable(table, 'data.csv')