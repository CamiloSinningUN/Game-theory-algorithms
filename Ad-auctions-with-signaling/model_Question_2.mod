# Define the set of states
set STATES := {1..7};

# Define the parameters
param mu1 := 1/3;
param mu2 := 1/3;
param mu3 := 1/3;

# Define the variables
var p{STATES} >= 0;

# Define the equations
s.t. eq1: p[1] + 0.5*p[4] + 0.5*p[6] + (1/3)*p[7] = mu1;
s.t. eq2: p[2] + 0.5*p[4] + 0.5*p[5] + (1/3)*p[7] = mu2;
s.t. eq3: p[3] + 0.5*p[5] + 0.5*p[6] + (1/3)*p[7] = mu3;

# Probability consistency constraint
s.t. sum_p: sum {s in STATES} p[s] = 1;

# Specify the objective (if any, here we assume it's to minimize the sum of probabilities, which is not really needed)
# minimize obj: sum {s in STATES} p[s];

# Solve the problem
solve;

# Display the results
display p;
