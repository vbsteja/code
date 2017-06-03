def codemania_medal(user_time, gold, silver, bronze):
    m = user_time.split(":")
    n = gold.split(":")
    o = silver.split(":")
    p = bronze.split(":")
    u = m[0] * 60 * 60 + m[1] * 60 + m[2]
    g = n[0] * 60 * 60 + n[1] * 60 + n[2]
    s = o[0] * 60 * 60 + o[1] * 60 + o[2]
    b = p[0] * 60 * 60 + p[1] * 60 + p[2]
    return "Gold" if u < g else "Silver" if u < s else "Bronze" if u < b else "None"


print(codemania_medal("01:15:00", "00:15:00", "00:45:00", "01:15:00"))
