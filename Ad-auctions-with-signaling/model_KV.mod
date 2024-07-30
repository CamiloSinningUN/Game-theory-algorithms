#  --- SETS, PARAMETERS, AND VARIABLES ---
set STATES;
set PI; # Index of permutations

param m integer >= 0; # Number of slots
param v{PI, 0..m, STATES} >= 0; # type of bidder
param lambda{0..m} >= 0; # Promminence of slot
param mu{STATES} >= 0; # Number of bidders

var x{PI, STATES} >= 0, <= 1; # Strategy

# --- OBJECTIVE ---
maximize obj:
    sum{pi in PI, theta in STATES} x[pi, theta]*sum{j in 1..m} j*v[pi, j, theta]*(lambda[j-1] - lambda[j])
;

# --- CONSTRAINTS ---
subject to cons1 {theta in STATES}:
    sum{pi in PI} x[pi, theta] = mu[theta]
;

subject to cons2 {pi in PI, j in 0..m-1}:
    sum{theta in STATES} x[pi, theta]*(v[pi, j, theta] - v[pi, j+1, theta]) >= 0
;