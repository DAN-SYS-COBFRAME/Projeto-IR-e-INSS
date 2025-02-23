IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CALC-SALARIO.                                             
       AUTHOR.        FAUSTO.                                                   
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       01 WS-NOME     PIC X(30).                                                
       01 WS-SALARIO-BRUTO    PIC 9(6)V99.                                      
       01 WS-INSS     PIC 9(6)V99 VALUE 0.                                      
       01 WS-IR       PIC 9(6)V99 VALUE 0.                                      
       01 WS-SALARIO-LIQUIDO  PIC 9(6)V99.                                      
       PROCEDURE DIVISION.                                                      
       MAIN-PROCEDURE.                                                          
      *                                                                         
      * SOLICITACAO DE DADOS USUARIO                                            
      *                                                                         
           DISPLAY "DIGITE O NOME DO FUNCIONARIO:".                             
           ACCEPT WS-NOME.                                                      
      *   *                                                                     
      *   *                                                                     
           DISPLAY "DIGITE O SALARIO DO FUNCIONARIO:".                          
           ACCEPT WS-SALARIO-BRUTO.                                             
      *   *                                                                     
      *   * CALCULO DO INSS (8% DO SALARIO BRUTO)                               
      *                                                                         
           COMPUTE WS-INSS = WS-SALARIO-BRUTO * 0.08.                           
      *   *                                                                     
      *   * CALCULO IR COM BASE NA TABELA.                                      
      *   *                                                                     
           IF WS-SALARIO-BRUTO <= 2000                                          
              MOVE 0 TO WS-IR                                                   
           ELSE IF WS-SALARIO-BRUTO <= 3500                                     
              COMPUTE WS-IR = WS-SALARIO-BRUTO * 0.10                           
           ELSE                                                                 
              COMPUTE WS-IR = WS-SALARIO-BRUTO * 0.15                           
           END-IF.                                                              
      *   *                                                                     
      *   * CALCULO DO SALARIO LIQUIDO.                                         
      *   *                                                                     
           COMPUTE WS-SALARIO-LIQUIDO =                                         
               WS-SALARIO-BRUTO - WS-INSS - WS-IR.                              
      *   *                                                                     
      *   * EXIBIR OS RESULTADOS                                                
      *   *                                                                     
           DISPLAY "---------------------------".                               
           DISPLAY "NOME FUNCIONARIO: " WS-NOME.                                
           DISPLAY "SALARIO BRUTO: R$" WS-SALARIO-BRUTO.                        
           DISPLAY "DESCONTO INSS: R$" WS-INSS.                                 
           DISPLAY "DESCONTO IR: R$" WS-IR.                                     
           DISPLAY "SALARIO LIQUIDO: R$" WS-SALARIO-LIQUIDO.                    
           DISPLAY "---------------------------".                               
      *   *                                                                     
      *   * FINALIZA O PROGRAMA                                                 
      *   *                                                                     
           STOP RUN.                                             
