function is_numeric(str) {
    return str ~ /^[0-9]+\.?[0-9]*$/
}

function extract_deepest_level(line) {
    # Remover capas externas iterativamente
    while (match(line, /\([^()]*\)/)) {
        deepest = substr(line, RSTART+1, RLENGTH-2)
        line = substr(line, 1, RSTART-1) substr(line, RSTART+RLENGTH)
    }

    return deepest
}

{
    deepest = extract_deepest_level($0)

    # Extraer pares key=value del nivel más profundo
    n = split(deepest, pairs, " ")
    for (i = 1; i <= n; i++) {
        if (index(pairs[i], "=") > 0) {
            split(pairs[i], kv, "=")
            key = kv[1]
            value = kv[2]

            key_count[key]++

            if (is_numeric(value)) {
                key_sum[key] += value
                key_numeric[key] = 1
            } else {
                key_numeric[key] = 0
            }
        }
    }
}
END {
    print "Key Statistics:"
    for (key in key_count) {
        if (key_numeric[key]) {
            avg = key_sum[key] / key_count[key]
            printf "%s: appears %d time(s), average value: %.2f\n", key, key_count[key], avg
        } else {
            printf "%s: appears %d time(s), non-numeric\n", key, key_count[key]
        }
    }
}
