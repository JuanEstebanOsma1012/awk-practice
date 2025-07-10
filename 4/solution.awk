function calculate_health_score(fields, total_fields) {
    filled = 0
    for (i = 1; i <= total_fields; i++) {
        if (fields[i] != "") filled++
    }
    return int((filled / total_fields) * 100)
}


BEGIN {

  FS=","
  columns[1] = "name"
  columns[2] = "last_name"
  columns[3] = "department"
  columns[4] = "salary"
  columns[5] = "position"
  columns[6] = "start_date"

  total_fields = 6

}
{

  for (i=1; i<=NF; i++) {

    fields[i] = $i
    if ($i != ""){

      field_completion[columns[i]]++
    }
  }

  health_score = calculate_health_score(fields, total_fields)

  missing = ""
  for (i = 1; i <= total_fields; i++) {
    if (fields[i] == "") {
      missing = missing (missing == "" ? "" : ", ") columns[i]
    }
  }

  print "Record " NR ": " $0
  if (missing == "") {
    print "  Health Score: " health_score "/100 (Complete)"
  } else {
    print "  Health Score: " health_score "/100 (Missing: " missing ")"
  }
  print ""

  total_records++

}
END {

  print "FIELD COMPLETION RATES:"
  for (field in field_completion) {
    completion_rate = (field_completion[field] / total_records) * 100
    printf "%s: %.2f%%\n", field, completion_rate
  }
}
