BEGIN {

  # This information is used by the system in order to
  # organize the list in descendant order when you use
  # a for in loop, otherwise, the iterables will be run
  # randomly
  PROCINFO["sorted_in"] = "@val_num_desc"

}

# Define the regexp that the lines should match with to use
# in the body block
/HTTP\/1.[01]" [45][0-9][0-9] / {

  # Extracting variables from the input in order to
  # make it more understandable
  ip = $1

  # Matching the ips with the exclude pattern given
  # throught invocation variables (CLI)
  if (exclude_pattern == "" || ip !~ exclude_pattern) {

    # All new positions start at 0
    problem_ips[ip]++

  }
}

# When the body block finishes you already have the ips
# and the counter for each one
END {

  # Run the list in descendant order to print it
  for (ip in problem_ips) {

    print ip ":" problem_ips[ip]

  }
}
