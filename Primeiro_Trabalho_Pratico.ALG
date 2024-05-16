Algoritmo "primeiro_trabalho_pratico"
//Primeiro Trabalho Prático
//Curso: Técnico em Informática
//Disciplina: Lógica de Programação
//Prof. Wender Magno Cota
//Aluno: Vinícius José Pires Silva
//OBS.: Professor, peço que execute o algortimo em tela cheia, o VisualG anda dando alguns bugs visuais. Obrigado.

Var
   //Variáveis inteiras
   formPeca, materPeca, lojaCompra, contVetor, totalTinta: inteiro

   //Variáveis reais
   medidaI, medidaII, medidaIII, volume, area, pesoAtual:real
   maiorVolGeral, pesoEstatua, quantTinta, vendasMaiorVol, maiorVolCilindro:real
   
   //Vetores:
   nomesMater:vetor [1..3] de caractere
   primeiraPeca:vetor [1..3] de logico
   maiorVol:vetor [1..3] de real
   menorVol:vetor [1..3] de real
   maiorPeso:vetor [1..3] de real
   
   nomesLojas:vetor [1..7] de caractere
   gastosLojas:vetor [1..7] de real
   contEsf:vetor [1..7] de inteiro
   contPara:vetor [1..7] de inteiro
   contCilin:vetor [1..7] de inteiro
   
   contEsfMedia:vetor [1..3] de inteiro
   pesoEsfMedia:vetor [1..3] de real

Inicio
   //Inicialização de algumas variáveis e vetores
   formPeca <- 0
   quantTinta <- 0
   pesoEstatua <- 0
   maiorVolGeral <- 0
   vendasMaiorVol <- 0
   maiorVolCilindro <- 0
   nomesLojas[1] <- "Casa Zé   "
   nomesLojas[2] <- "Casa Paulo"
   nomesLojas[3] <- "Casa João "
   nomesLojas[4] <- "Casa Chico"
   nomesLojas[5] <- "Casa Mané "
   nomesLojas[6] <- "Casa Alfa "
   nomesLojas[7] <- "Casa Beta "
   nomesMater[1] <- "Aço     "
   nomesMater[2] <- "Alumínio"
   nomesMater[3] <- "Cobre   "
   
   para contVetor <- 1 ate 7 faca
      se (contVetor>=1) e (contVetor<=3) entao
         primeiraPeca[contVetor] <- verdadeiro
         maiorPeso[contVetor] <- 0
         contEsfMedia[contVetor] <- 0
         pesoEsfMedia[contVetor] <- 0
      fimse
      gastosLojas[contVetor] <- 0
      contEsf[contVetor] <- 0
      contPara[contVetor] <- 0
      contCilin[contVetor] <- 0
   fimpara
   
   //Informações
   escreval()
   escreval("----Software de gerenciamento da construção da estátua do R10----")
   escreval("--------------------Professor João Puxa-Puxa--------------------")
   
   //Loop para a entrada de uma quantidade indefinida de peças
   enquanto formPeca <> 4 faca
      //Entrada e validação do formato da peça
      escreval()
      escreval("--------------------Entrada de uma nova peça--------------------")
      escreval()
      escreval("1-Esfera, 2-Paralelepipedo, 3-Cilindro, 4-Finalizar")
      escreva("Forneca o código do formato da peça (ou 4 para finalizar): ")
      leia(formPeca)
      
      enquanto (formPeca < 1) ou (formPeca > 4) faca
         escreval()
         escreval("1-Esfera, 2-Paralelepipedo, 3-Cilindro, 4-Finalizar")
         escreva("Código inválido! Tente Novamente: ")
         leia(formPeca)
      fimenquanto

      //Estrutura condicional: Finaliza o loop caso necessário
      se formPeca <> 4 entao
         //Entrada e validação dos códigos do material e da loja de aquisição
         escreval()
         escreval("1-Aço, 2-Alumínio, 3-Cobre")
         escreva("Forneca o código do tipo de material da peça: ")
         leia(materPeca)
         
         enquanto (materPeca < 1) ou (materPeca > 3) faca
            escreval()
            escreval("1-Aço, 2-Alumínio, 3-Cobre")
            escreva("Código inválido! Tente Novamente: ")
            leia(materPeca)
         fimenquanto

         escreval()
         escreval("1-Casa Zé, 2-Casa Paulo, 3-Casa João, 4-Casa Chico")
         escreval("5-Casa Mané, 6-Casa Alfa, 7-Casa Beta")
         escreva("Forneca o código da loja de aquisição: ")
         leia(lojaCompra)
         
         enquanto (lojaCompra < 1) ou (lojaCompra > 7) faca
            escreval()
            escreval("1-Casa Zé, 2-Casa Paulo, 3-Casa João, 4-Casa Chico")
            escreval("5-Casa Mané, 6-Casa Alfa, 7-Casa Beta")
            escreva("Código inválido! Tente Novamente: ")
            leia(lojaCompra)
         fimenquanto
         
         //Entrada dos valores das medidas de acordo com o formato selecionado
         //Cálculos e comandos que utilizam o formato da peça
         escolha formPeca
            caso 1
               //Esfera: Entrada, validação(medidas) e cálculos(área e volume)
               escreval()
               escreva("Forneça o valor do raio da esfera (em mm):" )
               leia(medidaI)
               
               enquanto (medidaI <= 0) faca
                  escreval()
                  escreva("Medida inválida! Tente novamente: ")
                  leia(medidaI)
               fimenquanto
               
               area <- 4*pi*((medidaI / 10)^2)
               volume <- (pi*((medidaI / 10)^3))*4/3
               
               //Contador de esferas compradas na loja selecionada
               contEsf[lojaCompra] <- contEsf[lojaCompra] + 1
               
            caso 2
               //Paralelepípedo: Entrada, validação(medidas) e cálculos (área e volume)
               escreval()
               escreva("Forneça o valor da altura do paralelepípedo (em mm): ")
               leia(medidaI)
               
               enquanto (medidaI <= 0) faça
                  escreval()
                  escreva("Medida inválida! Tente novamente: ")
                  leia(medidaI)
               fimenquanto
               
               escreval()
               escreva("Forneça o valor da largura do paralelepípedo (em mm): ")
               leia(medidaII)

               enquanto (medidaII <= 0) faça
                  escreval()
                  escreva("Medida inválida! Tente novamente: ")
                  leia(medidaII)
               fimenquanto
               
               escreval()
               escreva("Forneça o valor da profundidade do paralelepípedo (em mm): ")
               leia(medidaIII)

               enquanto (medidaIII <= 0) faça
                  escreval()
                  escreva("Medida inválida! Tente novamente: ")
                  leia(medidaIII)
               fimenquanto
               
               area <- 2*medidaI/10*medidaII/10 + 2*medidaI/10*medidaIII/10 + 2*medidaII/10*medidaIII/10
               volume <- medidaI/10 * medidaII/10 * medidaIII/10
               
               //Contador de paralelepípedos comprados na loja selecionada
               contPara[lojaCompra] <- contPara[lojaCompra] + 1
               
            caso 3
               //Cilindro: Entrada, validação (medidas) e cálculos (área e volume)
               escreval()
               escreva("Forneça o valor do raio do cilindro (em mm):" )
               leia(medidaI)

               enquanto (medidaI <= 0) faca
                  escreval()
                  escreva("Medida inválida! Tente novamente: ")
                  leia(medidaI)
               fimenquanto
               
               escreval()
               escreva("Forneça o valor da altura do cilindro (em mm):" )
               leia(medidaII)

               enquanto (medidaII <= 0) faca
                  escreval()
                  escreva("Medida inválida! Tente novamente: ")
                  leia(medidaII)
               fimenquanto
               
               area <- 2*pi*(medidaI/10)^2 + 2*pi*(medidaI/10)*(medidaII/10)
               volume <- pi*(medidaI/10)^2*(medidaII/10)
               
               //Definir o cilindro com maior volume
               se volume > maiorVolCilindro entao
                  maiorVolCilindro <- volume
               fimse
               
               //Contador de cilindros compradas na loja selecionada
               contCilin[lojaCompra] <- contCilin[lojaCompra] + 1
         fimescolha

         //Cálculos que utilizam o tipo de material: peso e quantidade de tinta
         escolha materPeca
         caso 1
            //Aço
            pesoAtual <- volume * 7.8

            quantTinta <- quantTinta + (area*0.02)
         caso 2
            //Alumínio
            pesoAtual <- volume * 2.6

            quantTinta <- quantTinta + (area*0.01)
         caso 3
            //Cobre
            pesoAtual <- volume * 8.8
            
            quantTinta <- quantTinta + (area*0.015)
         fimescolha

         //Cálculos e comandos que utilizam a loja de aquisição
         escolha lojaCompra
         caso 1
            //Loja Zé
            //O valor a ser pago a essa loja
            escolha materPeca
            caso 1
               gastosLojas[1] <- gastosLojas[1] + 100*pesoAtual
            caso 2
               gastosLojas[1] <- gastosLojas[1] + 80*pesoAtual
            caso 3
               gastosLojas[1] <- gastosLojas[1] + 130*pesoAtual
            fimescolha

         caso 2
            //Casa Paulo
            //O valor a ser pago a essa loja
            escolha materPeca
            caso 1
               gastosLojas[2] <- gastosLojas[2] + 110*pesoAtual
            caso 2
               gastosLojas[2] <- gastosLojas[2] + 75*pesoAtual
            caso 3
               gastosLojas[2] <- gastosLojas[2] + 120*pesoAtual
            fimescolha

         caso 3
            //Casa Joao
            //O valor a ser pago a essa loja
            escolha materPeca
            caso 1
               gastosLojas[3] <- gastosLojas[3] + 150*pesoAtual
            caso 2
               gastosLojas[3] <- gastosLojas[3] + 90*pesoAtual
            caso 3
               gastosLojas[3] <- gastosLojas[3] + 115*pesoAtual
            fimescolha

         caso 4
            //Casa Chico
            //O valor a ser pago a essa loja
            escolha materPeca
            caso 1
               gastosLojas[4] <- gastosLojas[4] + 110*pesoAtual
            caso 2
               gastosLojas[4] <- gastosLojas[4] + 100*pesoAtual
            caso 3
               gastosLojas[4] <- gastosLojas[4] + 160*pesoAtual
            fimescolha

         caso 5
            //Casa Mané
            //O valor a ser pago a essa loja
            escolha materPeca
            caso 1
               gastosLojas[5] <- gastosLojas[5] + 110*pesoAtual
            caso 2
               gastosLojas[5] <- gastosLojas[5] + 50*pesoAtual
            caso 3
               gastosLojas[5] <- gastosLojas[5] + 160*pesoAtual
            fimescolha

         caso 6
            //Casa Alfa
            //O valor a ser pago a essa loja
            escolha materPeca
            caso 1
               gastosLojas[6] <- gastosLojas[6] + 90*pesoAtual
            caso 2
               gastosLojas[6] <- gastosLojas[6] + 50*pesoAtual
            caso 3
               gastosLojas[6] <- gastosLojas[6] + 110*pesoAtual
            fimescolha

         caso 7
            //Casa Beta
            //O valor a ser pago a essa loja
            escolha materPeca
            caso 1
               gastosLojas[7] <- gastosLojas[7] + 140*pesoAtual
            caso 2
               gastosLojas[7] <- gastosLojas[7] + 100*pesoAtual
            caso 3
               gastosLojas[7] <- gastosLojas[7] + 180*pesoAtual
            fimescolha
         fimescolha

         //Incremento do peso total da estátua
         pesoEstatua <- pesoEstatua + pesoAtual
         
         //Definir o maior volume encontrado
         se volume > maiorVolGeral entao
            maiorVolGeral <- volume
         fimse
         
         //Maior peça, em peso, de cada material
         se pesoAtual > maiorPeso[materPeca] entao
            maiorPeso[materPeca] <- pesoAtual
         fimse
         
         //A maior e o menor peça, em volume, de cada material
         se primeiraPeca[materPeca] = verdadeiro entao
            maiorVol[materPeca] <- volume
            menorVol[materPeca] <- volume
            primeiraPeca[materPeca] <- falso
         senao
            se volume > maiorVol[materPeca] entao
               maiorVol[materPeca] <- volume
            senao
               se volume < menorVol[materPeca] entao
                  menorVol[materPeca] <- volume
               fimse
            fimse
         fimse
            
         //Peso médio das esferas de cada material
         se formPeca = 1 entao
            pesoEsfMedia[materPeca] <- pesoEsfMedia[materPeca] + pesoAtual
            contEsfMedia[materPeca] <- contEsfMedia[materPeca] + 1
         fimse
         
      fimse
   fimenquanto
   //Fim do loop e das entradas de novas peças
   escreval()
   escreval("---------------------Fim da entrada de peças--------------------")
   escreval()
   
   //Arredonda a quantidade de tinta para o inteiro maior mais próximo (ex: 2.2 -> 3)
   totalTinta<- int(quantTinta+0.9999999999)

   //Garante a compra de pelo menos uma lata de tinta de 1L, caso necessário
   se totalTinta < 1 entao
      totalTinta <- 1
   fimse
   
   //Identifica se houve entrada de dados de pelo menos uma peça
   se pesoEstatua > 0 entao
      lojaCompra <- 0
      //Loja onde as tintas foram compradas
      escreval()
      escreval("------------------------Compra das tintas-----------------------")
      escreval()
      escreval("1-Casa Zé, 2-Casa Paulo, 3-Casa João, 4-Casa Chico")
      escreval("5-Casa Mané, 6-Casa Alfa, 7-Casa Beta")
      escreva("Forneca o código da loja de aquisição das tintas: ")
      leia(lojaCompra)

      enquanto (lojaCompra < 1) ou (lojaCompra > 7) faca
         escreval()
         escreval("1-Casa Zé, 2-Casa Paulo, 3-Casa João, 4-Casa Chico")
         escreval("5-Casa Mané, 6-Casa Alfa, 7-Casa Beta")
         escreva("Código inválido! Tente Novamente: ")
         leia(lojaCompra)
      fimenquanto

      //Adição do valor das tintas ao valor a ser pago na loja selecionada
      gastosLojas[lojaCompra] <- gastosLojas[lojaCompra] + (totalTinta div 10 * 120.5) + (totalTinta mod 10 div 4 * 70.25) + (totalTinta mod 10 mod 4 * 30.85)

      //Definir qual(is) loja(s) obteve(ram) o maior volume de vendas
      vendasMaiorVol <- gastosLojas[1]
      para contVetor <- 2 ate 7 faca
         se gastosLojas[contVetor] > vendasMaiorVol entao
            vendasMaiorVol <- gastosLojas[contVetor]
         fimse
      fimpara

      //Impressão do relatório final
      //Evitei comentários pois a maioria das saídas são autoexplicativas
      escreval("----------------------------------------------------------------")
      escreval()
      escreval()
      escreval("-------------------------Relatório final------------------------")
      escreval()
      escreval("Peso total da estátua: ",pesoEstatua," g")
      escreval()
      
      //Imprime o peso da peça mais pesada de cada material
      para contVetor <- 1 ate 3 faca
         escreval("Maior peça, em peso, de ",nomesMater[contVetor],": ",maiorPeso[contVetor]," g")
      fimpara
      escreval()
      
      //Imprime o volume da maior e da menor peça, em volume, de cada material
      para contVetor <- 1 ate 3 faca
         escreval("Maior peça, em volume, de ",nomesMater[contVetor],": ",maiorVol[contVetor]," cm³")
         escreval("Menor peça, em volume, de ",nomesMater[contVetor],": ",menorVol[contVetor]," cm³")
         escreval()
      fimpara
      escreval()
      escreval()
      escreval("A quantidade de cada uma das peças compradas em cada uma das lojas: ")

      //Imprime a quantidade de peças compradas em cada loja
      para contVetor <- 1 ate 7 faca
         escreval("Esferas compradas na ",nomesLojas[contVetor],"        : ",contEsf[contVetor])
         escreval("Paralelepípedos comprados na ",nomesLojas[contVetor],": ",contPara[contVetor])
         escreval("Cilindros comprados na  ",nomesLojas[contVetor],"     : ",contCilin[contVetor])
         escreval()
      fimpara
      
      escreval()
      escreval("Número de latas de tinta necessárias: ")
      escreval("-- 10 Litros: ",totalTinta div 10)
      escreval("--  4 Litros: ",(totalTinta mod 10) div 4)
      escreval("--  1 Litros: ",((totalTinta mod 10) mod 4))
      escreval()
      escreval("O valor a ser pago à cada uma das lojas: ")

      //Imprime o valor a ser pago à cada uma das lojas e limita as casas decimais dos valores(2 casas)
      para contVetor <- 1 ate 7 faca
         escreval(nomesLojas[contVetor],": R$ ",gastosLojas[contVetor]:1:2)
      fimpara
      
      escreval()
      escreval("Maior peça, em volume, encontrada  : ",maiorVolGeral," cm³")
      escreval()
      
      //Imprime o peso médio das esferas de cada material
      para contVetor <- 1 ate 3 faca
         se contEsfMedia[contVetor] > 0 entao
            escreval("Peso médio das esferas de ",nomesMater[contVetor],": ",pesoEsfMedia[contVetor] / contEsfMedia[contVetor]," g" )
         senao
            escreval("Não houve entrada de dados de esferas de ",nomesMater[contVetor],"!")
         fimse
      fimpara
      
      escreval()
      escreval("Maior peça, em volume, cilíndrica  : ",maiorVolCilindro," cm³")
      escreval()
      escreva("Valor total gasto na construção    : R$")
      escreval((gastosLojas[1]+gastosLojas[2]+gastosLojas[3]+gastosLojas[4]+gastosLojas[5]+gastosLojas[6]+gastosLojas[7]):2:2)
      escreval()
      escreval()
      escreval("Loja(s) que obteve(ram) o maior volume de vendas em R$: ")

      //Compara o maior volume de vendas com as vendas de cada Loja
      Para contVetor <- 1 ate 7 faca
         se gastosLojas[contVetor] = vendasMaiorVol entao
            escreval(nomesLojas[contVetor])
         fimse
      fimpara
   senao
      escreval("Relatório omitido! Não houveram entradas de peças!")
   fimse
   escreval()
   escreval("----------------------------------------------------------------")
Fimalgoritmo