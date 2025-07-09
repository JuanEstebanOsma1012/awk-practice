BEGIN {

  # It's needed by AWK in order to understand .csv files
  FS=","

  # Variables declaration
  # Used to ensure the counters would start by 0
  transaction_number = 0
  balance["CREDIT"] = 0
  balance["DEBIT"] = 0
}
{

  # Extracting variables from the input in order to make it more understandable
  description = $4

  # Matching orf the descirption with the regexp
  # You cannot use a regexp as a variable, it doesn't work
  if (match(description, /[A-Z][0-9]/)) {

    type = $2
    amount = $3

    # Increment the balance of each type
    balance[type] += amount
    transaction_number++

    # Use commas in order to space the fields with a whitespace caracter
    print transaction_number, type, amount, balance[type]
  }
}
# Unnecessary block
END {}
