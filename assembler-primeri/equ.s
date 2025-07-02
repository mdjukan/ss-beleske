.section X
x1: .quad 0 # 0
x2: .quad 0 # 8

.equ TMP, x1 + (y2 - y1)
.quad TMP

.section Y
y1: .quad 0 # 0
y2: .quad 0 # 8

.equ Z1, 10 # ABS

.equ Z2, x2 - x1 #ABS

# ADDR(X)
# x1   ADDR(X) + OFF(x1)
# x2   ADDR(X) + OFF(x2)
# x2 - x1 (ADDR(X) + OFF(x2)) - (ADDR(X) + OFF(x1))
# x2 - x1 OFF(x2) - OFF(x1)

# .equ Z2, x1 + y1 ### invalid
# x1 + y1 (AADR(X) + OFF(x1)) + (ADDR(Y) + OFF(y1))
# x1 + y1 ADDR(X) + ADDR(Y) + OFF(x1) + OFF(y1)

.equ Z3, x1 + (y2 - y1)  ## Z3 X, 8

# x1 + (y2 - y1) (ADDR(X) + OFF(x1)) + ((ADDR(Y) + OFF(y2)) - (ADDR(Y) + OFF(y1)))
# x1 + (y2 - y1) ADDR(X) + OFF(x1) + OFF(y2) - OFF(y1)

# Indeks klasifikacije
# .equ symbol, expr
# expr -- sybmols, const, +, -
# [1] transformacija expr
#     aspsolutni simboli, konstante se menjaju 0
#     normalni simboli se menjaju sa 1.section gde je section sekcija kojoj simbol pripada
#     spoljasnji simboli se menjaju sa 1.unique(sym) gde je sym ime simbola
#     x2 - x1 ---> 1.X - 1.X
#     x1 + y1 ---> 1.X + 1.Y
#     x1 + (y2 - y1) ---> 1.X + (1.Y - 1.Y)
# [2] svodjenje izraza na minimalni oblik
#     a.section + b.section = (a+b).section
#     a.section - b.section = (a-b).section
#     x2 - x1 ---> 1.X - 1.X --> 0.X --> 0
#     x1 + y1 ---> 1.X + 1.Y --> 1.X + 1.Y
#     x1 + (y2 - y1) ---> 1.X + (1.Y - 1.Y) --> 1.X + 0.Y --> 1.X
# [3] klasifikacija
#     ako je minimalni oblik izraza 0 simbol je apslutni 0 --> ABS
#     ako je minimalni oblik izraza oblika 1.section simbola pripada sekciji section
#     ako je minimialni oblik izraza bilo sta drugo --> definicija nije validna



