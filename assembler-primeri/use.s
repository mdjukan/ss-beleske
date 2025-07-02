.intel_syntax noprefix
.section .data
X: .quad 1

.global X
.global Y

.section .text
foo:
    mov rax, X        # R[rax] := M[value(X)]
    mov rax, OFFSET X # R[rax] := value(X)

.equ Y, 10
    mov rax, OFFSET Y[rbx] # R[rax] := M[rbx + value(Y)]
    mov rax, OFFSET X[rip] # R[rax] := M[value(X)]
