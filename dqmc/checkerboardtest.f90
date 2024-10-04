program checkerboardtest
    use numbertypes
    use checkerboard_mod
    use checkerboardtests_mod
    use convenientla_mod
    implicit none

    type(checkerboard)    :: ckb
    character(len=100)    :: filename = "ckb.txt"
    integer               :: iounit
    integer               :: n
    real(dp), allocatable :: A(:, :)
    real(dp), allocatable :: B(:, :)
    real(dp), allocatable :: C(:, :)


    call read_ckb(ckb, filename, iounit)
    n = 16

    allocate(A(n, n))
    allocate(B(n, n))
    allocate(C(n, n))

    call make_explicitckbright(ckb, A, n)
    call make_explicitckbleft(ckb, B, n)
    call make_explicitckb(ckb, C, n)



    print *, twonorm(A - B)
    print *, twonorm(C - A)
    print *, twonorm(B - C)








endprogram checkerboardtest