C     NAMING CONVENTIONS USED -
C      A-G       REAL IN COMMON BLOCK
C      H         CHARACTER IN COMMON BLOCK
C      HZ        CHARACTER, INTERNAL
C      I-J       INTEGER, INTERNAL
C      KP        PARAMETER IN COMMON BLOCK
C      K         PARAMETER, INTERNAL
C      L         LOGICAL IN COMMON BLOCK
C      LZ        LOGICAL, INTERNAL
C      M         INTEGER, INTERNAL
C      N         INTEGER IN COMMON BLOCK
C      O-Y       REAL IN COMMON BLOCK
C      Z         INTERNAL

      PROGRAM SOLVE
      PARAMETER (ISZ=1000)
      INTEGER IANS
      INTEGER IX1,IX2,IY1,IY2
      INTEGER IDX,IDY
      CHARACTER CPNT
      DIMENSION IWLD(ISZ, ISZ)
      IANS=0

      DO I=1,ISZ
      DO J=1,ISZ
      IWLD(I,J)=0
      END DO
      END DO

      OPEN(1, FILE='input.txt', STATUS='old')
      DO I=1,500

      READ(1,*) IX1,IY1,CPNT,IX2,IY2

      IF(IX1.EQ.IX2)THEN
      DO IY=MIN(IY1,IY2)+1,MAX(IY1,IY2)+1
      IWLD(IX1+1,IY)=IWLD(IX1+1,IY)+1
      END DO

      ELSE IF(IY1.EQ.IY2)THEN
      DO IX=MIN(IX1,IX2)+1,MAX(IX1,IX2)+1
      IWLD(IX,IY1+1)=IWLD(IX,IY1+1)+1
      END DO
      ELSE

      IF(IX1.GT.IX2)THEN
      IDX=-1
      ELSE
      IDX=1
      END IF

      IF(IY1.GT.IY2)THEN
      IDY=-1
      ELSE
      IDY=1
      END IF

      DO IXY=1,MAX(IX1,IX2)-MIN(IX1,IX2)+1
      IWLD(IX1+1,IY1+1)=IWLD(IX1+1,IY1+1)+1
      IX1=IX1+IDX
      IY1=IY1+IDY
      END DO

      END IF
      END DO

      DO I=1,ISZ
      DO J=1,ISZ
      IF(IWLD(I,J).GE.2)THEN
      IANS=IANS+1
      END IF
      END DO
      END DO
      PRINT*,"ANSWER IS: ", IANS
      END PROGRAM

