lastTwo = lambda n, k: "01" if k == 0 else "00" if n == 0 else str(
    n**int(str(k)[-3:]))[-2:]
print(lastTwo(14, 4))
print("ello")
for value in range(1, 10):
    print(value)
print("Hello")
