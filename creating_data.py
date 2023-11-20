import random
# Your initial set of tuples
tuples_list = [
    (8, 1, 1, 50),
    (8, 2, 1, 67),
    (8, 3, 1, 89),
    (8, 6, 1, 24),
    (8, 27, 1, 12)
]
# Update each tuple: change the first number to 10 and the last number to a random number from 1 to 100
for i in range(len(tuples_list)):
    tuples_list[i] = (100, tuples_list[i][1], tuples_list[i][2], random.randint(1, 99))
# Print the updated list of tuples with commas between them
print(*tuples_list, sep=',\n')
