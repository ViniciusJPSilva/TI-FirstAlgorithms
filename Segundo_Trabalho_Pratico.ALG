Algoritmo "segundo_trabalho_pratico"
//Segundo Trabalho Pr�tico
//Curso: T�cnico em Inform�tica
//Disciplina: L�gica de Programa��o
//Prof. Wender Magno Cota
//Aluno: Vin�cius Jos� Pires Silva

Const
   //Define o tamanho dos vetores bin�rios (quantos bits ter�o).
   BITS = 16
   //Define o tamanho do vetor que armazena os "Vai Um", possui uma posi��o a mais para a verifica��o de overflow.
   UP = BITS + 1
Var
   //Vetores
   numUmBin, numDoisBin, resBin:vetor [1..BITS] de inteiro
   vaiUm:vetor [1..UP] de inteiro
   //Inteiros e Reais
   primNum, segNum, i, soma:inteiro
   resBaseDez:real
   //L�gicos
   negPrim, negSeg, negRes:logico
   
Inicio
   negPrim <- verdadeiro
   negSeg <- verdadeiro
   negRes <- verdadeiro
   
   //Apresenta��o.
   escreval("----------------------------------------------------------------")
   escreval("---------------Somador Bin�rio - Complemento de 2---------------")
   escreval("---------------------------",BITS," bits ----------------------------")
   escreval("----------------------------------------------------------------")
   escreval()
   escreval("----------------------Entrada das Parcelas----------------------")
   escreval()
   
   //Entrada da primeira parcela.
   escreva("Forne�a um n�mero inteiro para a primeira parcela (base 10): ")
   leia(primNum)
   
   //Valida��o baseada na capacidade de armazenamento de 'BITS'(constante) bits .
   enquanto (primNum < -(2^(BITS-1))) ou (primNum > (2^(BITS-1)-1)) faca
      escreval()
      escreval("O n�mero fornecido n�o pode ser representado em ",BITS," bits!!")
      escreval("Forne�a um n�mero que esteja entre ",2^(BITS-1)*(-1)," e ",2^(BITS-1)-1)
      escreva("Tente novamente: ")
      leia(primNum)
   fimenquanto
   
   //Verifica��o do sinal da entrada.
   se primNum < 0 entao
      primNum <- primNum * (-1)
      negPrim <- falso
   fimse
   
   //Entrada da segunda parcela.
   escreval()
   escreva("Forne�a um n�mero inteiro para a segunda parcela (base 10): ")
   leia(segNum)
   
   //Valida��o baseada na capacidade de armazenamento de N bits.
   enquanto (segNum < -(2^(BITS-1))) ou (segNum > (2^(BITS-1)-1)) faca
      escreval()
      escreval("O n�mero fornecido n�o pode ser representado em ",BITS," bits!!")
      escreval("Forne�a um n�mero que esteja entre ",2^(BITS-1)*(-1)," e ",2^(BITS-1)-1)
      escreva("Tente novamente: ")
      leia(segNum)
   fimenquanto
   
   //Verifica��o do sinal da entrada.
   se segNum < 0 entao
      segNum <- segNum * (-1)
      negSeg <- falso
   fimse
   
   //Convers�o da Base 10 para a Base 2 de ambas as entradas.
   para i <- 1 ate BITS faca
      se primNum mod 2 = 0 entao
         numUmBin[i] <- 0
      senao
         numUmBin[i] <- 1
      fimse
      
      se segNum mod 2 = 0 entao
         numDoisBin[i] <- 0
      senao
         numDoisBin[i] <- 1
      fimse
      
      primNum <- primNum div 2
      segNum <- segNum div 2
      
      vaiUm[i] <- 0
   fimpara

   //Complemento a 2 da primeira entrada, caso necess�rio.
   se negPrim = falso entao
      para i <- 1 ate BITS faca
         //Aplica��o do complemento a 1: inverte o bit.
         numUmBin[i] <- (numUmBin[i] - 1) * (-1)

         //Acr�scimo de 1.
         se i = 1 entao
            soma <- numUmBin[1] + 1
         senao
            soma <- numUmBin[i] + vaiUm[i]
         fimse

         escolha soma
         caso 0
            numUmBin[i] <- 0
         caso 1
            numUmBin[i] <- 1
         caso 2
            numUmBin[i] <- 0
            vaiUm[i + 1] <- 1
         caso 3
            numUmBin[i] <- 1
            vaiUm[i + 1] <- 1
         fimescolha
      fimpara
   fimse
   
   //Complemento a 2 da segunda entrada, caso necess�rio.
   se negSeg = falso entao
      para i <- 1 ate BITS faca
         //Aplica��o do complemento a 1 inverte o bit.
         numDoisBin[i] <- (numDoisBin[i] - 1) * (-1)
      
         //Acr�scimo de 1.
         se i = 1 entao
            soma <- numDoisBin[1] + 1
         senao
            soma <- numDoisBin[i] + vaiUm[i]
         fimse

         escolha soma
         caso 0
            numDoisBin[i] <- 0
            vaiUm[i + 1] <- 0
         caso 1
            numDoisBin[i] <- 1
            vaiUm[i + 1] <- 0
         caso 2
            numDoisBin[i] <- 0
            vaiUm[i + 1] <- 1
         caso 3
            numDoisBin[i] <- 1
            vaiUm[i + 1] <- 1
         fimescolha
      fimpara
   fimse
   
   //Circuito Somador.
   //Obs.: O pr�prio circuito limpa o vetor VAI UM.
   para i <- 1 ate BITS faca
      soma <- numUmBin[i] + numDoisBin[i] + vaiUm[i]
      
      escolha soma
         caso 0
            resBin[i] <- 0
            vaiUm[i + 1] <- 0
         caso 1
            resBin[i] <- 1
            vaiUm[i + 1] <- 0
         caso 2
            resBin[i] <- 0
            vaiUm[i + 1] <- 1
         caso 3
            resBin[i] <- 1
            vaiUm[i + 1] <- 1
      fimescolha
   fimpara
   
   //Impress�o das parcelas da soma (base 2)
   escreval()
   escreval("-----------------------Parcelas na Base 2-----------------------")
   escreval()
   escreva("Primeira parcela(base 2) = ")
   i <- BITS
   enquanto i >= 1 faca
      escreva(numUmBin[i])
      i <- i - 1
   fimenquanto
   escreval()
   
   escreva("Segunda parcela (base 2) = ")
   i <- BITS
   enquanto i >= 1 faca
      escreva(numDoisBin[i])
      i <- i - 1
   fimenquanto
   escreval()
   escreval()
   escreval("-----------------------Resultado da Soma-----------------------")
   escreval()
   
   //Verificando se o sinal do resultado � oposto ao das entradas, caso ambas entradas tenham o mesmo sinal.
   se (((numUmBin[BITS] = 1) e (numDoisBin[BITS] = 1)) e (resBin[BITS] = 0)) ou (((numUmBin[BITS] = 0) e (numDoisBin[BITS] = 0)) e (resBin[BITS] = 1)) entao
      escreval("Ocorreu um Overflow! Resultado omitido!")
   senao

      //Verificando se ocorreu overflow: vai 1 para bit de sinal e para fora do n�mero.
      se ((vaiUm[BITS] = 1) e (vaiUm[UP] = 1)) ou ((vaiUm[BITS] = 0) e (vaiUm[UP] = 0)) entao
      
         //Impress�o do resultado da soma: base 2.
         escreva("Resultado da soma (base 2) = ")
         i <- BITS
         enquanto i >= 1 faca
            escreva(resBin[i])
            i <- i - 1
         fimenquanto

         //Aplicando o inverso do complemento de 2, caso o resultado seja < 0, para represent�-lo corretamente na Base 10.
         se resBin[BITS] = 1 entao
            negRes <- falso

            //Limpando o vetor VAI UM.
            para i <- 1 ate UP faca
               vaiUm[i] <- 0
            fimpara

            //Subtra�ndo 1.
            para i <- 1 ate BITS faca
               se i = 1 entao
                  soma <- resBin[i] - 1
               senao
                  se vaiUm[i] = 1 entao
                     soma <- resBin[i] - vaiUm[i]
                  senao
                     soma <- resBin[i]
                  fimse
               fimse

               escolha soma
               caso 0
                  resBin[i] <- 0
               caso 1
                  resBin[i] <- 1
               caso -1
                  resBin[i] <- 1
                  vaiUm[i + 1] <- 1
               fimescolha
            fimpara

            //Aplica��o do complemento a 1.
            para i <- 1 ate BITS faca
               resBin[i] <- (resBin[i] - 1) * (-1)
            fimpara
         fimse

         //Convers�o do resultado da base 2 para a base 10.
         para i <- 1 ate BITS faca
            resBaseDez <- resBaseDez + ((2^(i-1)) * resBin[i])
         fimpara

         //Impress�o do resultado da soma: base 10.
         escreval()
         escreva("Resultado da soma (base 10) = ")
         se negRes = falso entao
            escreva(resBaseDez * (-1))
         senao
            escreva(resBaseDez)
         fimse

      senao
         escreval("Ocorreu um Overflow! Resultado omitido!")
      fimse
      
   fimse
   escreval()
   escreval()
   escreval("----------------------------------------------------------------")

Fimalgoritmo