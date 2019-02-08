%-------------------------------------------
% no tabs as indentation, line size very big
%-------------------------------------------

print.align.key = 0
print.use.tab = off
print.line.length = 200
verbose = on

%----------------------
% sort order for fields
%----------------------

sort = on
sort.format = {%s($type) %s($key)}
sort.order {* = author # title # journal # volume # pages # publisher # address # year}

%--------------------------------
% Semantic checks for year fields
%--------------------------------

check.rule { year "^[\"{]?[0-9][0-9][\"}]?$"   }
check.rule { year "^[\"{]?1[89][0-9][0-9][\"}]?$"   }
check.rule { year "^[\"{]?20[0-9][0-9][\"}]?$"   }
check.rule { year "" "\@ \$: Semantic error. Year has to be a suitable number" }

%---------------
% key generation
%---------------

key.generation = on
key.format = {%1p(author)%d(year)}
key.number.separator = {}
key.base = lower
fmt.et.al = {}

%-------------------------
% delete duplicate entries
%-------------------------

check.double.delete = on

%--------------------
% delete empty fields
%--------------------

rewrite.rule {"^\" *\"$"}
rewrite.rule {"^{ *}$"}
rewrite.rule {"ˆ{}$"}
rewrite.rule {"ˆ\"\"$"}

%-------------------------------------------------------
% delete useless fields introduced by reference managers
%-------------------------------------------------------
delete.field {abstract}
delete.field {doi}
delete.field {file}
delete.field {keywords}
delete.field {number}
delete.field {issn}
delete.field {isbn}