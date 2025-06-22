.section X
x1: .quad 1
x2: .quad 2

.section Y
y1: .quad 1
y2: .quad 2

.equ abs1, x2 - x1
.equ abs2, 4 * (x2 - x1)

# .equ invalid, x1 + y1 - x2 - y2 ## nije validan samo zbog redosleda navodenja
.equ valid, (x1 - x2) * (y1 - y2)

# .equ invalid, 4 * x1 - 4 * x2

# .equ invalid,  x1 - x2 + y2

.equ invalid, (x1 - x2)

.section Z
.quad x1 - x2 + y2  ## generise relokacioni zapis referisuci sekciju
# kojoj bi simbol definisan ovim izrazom pripadao

