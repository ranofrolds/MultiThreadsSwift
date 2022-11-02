import Foundation
import Glibc


class opThread: Thread{
    
    let waiter = DispatchGroup()
    var matriz1=[[Int]]()
    var matriz2=[[Int]]()
    var result=[[Int]]()
    var n=0
    var op=""

  
    init(matriz1: [[Int]], matriz2: [[Int]], n: Int, op: String){
        self.matriz1=matriz1
        self.matriz2=matriz2
        self.n=n
        self.result=[[Int]](repeating: [Int](repeating: 0, count: n), count: matriz1.count)
        self.op=op
        
    }
  
    override func start() {
        waiter.enter()
        super.start()
    }

    override func main() {
        task()
        waiter.leave()
    }

    func task() {
      
      
      
      let linhas=matriz1.count
      let colunas=self.n

      if(op=="Soma"){
        for i in 0..<linhas{
          for j in 0..<colunas{
            self.result[i][j]=self.matriz1[i][j]+self.matriz2[i][j]
          }
        }
      }
      else if(op=="Sub"){
        for i in 0..<linhas{
          for j in 0..<colunas{
            self.result[i][j]=self.matriz1[i][j]-self.matriz2[i][j]
          }
        }
      }
      else if(op=="Mult"){
        for i in 0..<linhas{
          for j in 0..<colunas{
            self.result[i][j]=self.matriz1[i][j]*self.matriz2[i][j]
          }
        }
      }
      else if(op=="Maior"){
        for i in 0..<linhas{
          for j in 0..<colunas{
            if(self.matriz1[i][j]>self.matriz2[i][j]){
              self.result[i][j] = self.matriz1[i][j]
            }else{
               self.result[i][j] = self.matriz2[i][j]
            }
          }
        }
      }
        
    }

    func getResult()->[[Int]]{
        return self.result
    }

    func join() {
        waiter.wait()
    } 
  
}


  func novaMatriz(matriz:[[Int]],inicio:Int, fim:Int, n:Int)->[[Int]]{
     var linhas=0
    if((fim-inicio)==0){
      linhas=1
    }
    else{
      linhas=fim-inicio
    }
   
      let colunas=n
    var nova=[[Int]](repeating: [Int](repeating: 0, count: n), count: linhas)
        for i in 0..<linhas{
          for j in 0..<colunas{
            nova[i][j]=matriz[inicio+i][j]
          }
        } 
      return nova;
  }
  
  func opMatrizesThread(matriz1: [[Int]], matriz2: [[Int]], n: Int, op: String){
    
      let aux=(n/10)

      var newMatriz1=novaMatriz(matriz: matriz1,inicio:0, fim:aux-1, n: n)
      var newMatriz2=novaMatriz(matriz: matriz2,inicio:0, fim:aux-1, n: n)
    
      let thread0 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n,op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:aux, fim:(aux*2)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:aux, fim:(aux*2)-1, n: n)
    
      let thread1 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n,op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*2), fim:(aux*3)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*2), fim:(aux*3)-1, n: n)

      let thread2 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n,op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*3), fim:(aux*4)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*3), fim:(aux*4)-1, n: n)
    
      let thread3 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n,op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*4), fim:(aux*5)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*4), fim:(aux*5)-1, n: n)

      let thread4 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n,op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*5), fim:(aux*6)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*5), fim:(aux*6)-1, n: n)

      let thread5 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n, op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*6), fim:(aux*7)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*6), fim:(aux*7)-1, n: n)
    
      let thread6 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n, op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*7), fim:(aux*8)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*7), fim:(aux*8)-1, n: n)
    
      let thread7 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n, op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*8), fim:(aux*9)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*8), fim:(aux*9)-1, n: n)
    
      let thread8 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n, op: op)

      newMatriz1=novaMatriz(matriz: matriz1,inicio:(aux*9), fim:(aux*10)-1, n: n)
      newMatriz2=novaMatriz(matriz: matriz2,inicio:(aux*9), fim:(aux*10)-1, n: n)
      
      let thread9 = opThread(matriz1: newMatriz1, matriz2: newMatriz2, n: n, op: op)
    
      
      let start = Date()
      

    
      thread0.start()
      thread1.start()
      thread2.start()
      thread3.start()
      thread4.start()
      thread5.start()
      thread6.start()
      thread7.start()
      thread8.start()
      thread9.start()

      thread0.join()
      thread1.join()
      thread2.join()
      thread3.join()
      thread4.join()
      thread5.join()
      thread6.join()
      thread7.join()
      thread8.join()
      thread9.join()

    //   print("===", op,"matriz com THREADS===")

    //   print(thread0.getResult())  
    //   print(thread1.getResult())
    //   print(thread2.getResult())
    //   print(thread3.getResult())
    //   print(thread4.getResult())
    //   print(thread5.getResult())
    //   print(thread6.getResult())
    //   print(thread7.getResult())
    //   print(thread8.getResult())
    //   print(thread9.getResult())
    
      let end = Date()
      let consumedTime = end.timeIntervalSince(start)

      print("TEMPO EXEC PARALELO: ",consumedTime,"\n\n")
      
    }

  
  func somaMatrizesSeq(matriz1: [[Int]], matriz2: [[Int]], n: Int){
    let aux1 = matriz1
    let aux2 = matriz2
    var soma=[[Int]](repeating: [Int](repeating: 0, count: n), count: n)

    
    let start = Date()
    
    for i in 0...(n-1){
      for j in 0...(n-1){
        soma[i][j] = aux1[i][j] + aux2[i][j]
      } 
    }

    let end = Date()
    let consumedTime = end.timeIntervalSince(start)
    
    // print("==========Matriz1==========")
    // printarMatriz(matriz:matriz1 ,n:n)
    // print("==========Matriz2==========")
    // printarMatriz(matriz:matriz2 ,n:n)
    // print("===Soma matriz sequencial===")
    // printarMatriz(matriz:soma ,n:n)

     print("\n\nTEMPO EXEC SEQUENCIAL: ",consumedTime,"\n\n")
  }



  func subtracaoMatrizesSeq(matriz1: [[Int]], matriz2: [[Int]], n: Int){

    let aux1 = matriz1
    let aux2 = matriz2
    var sub=[[Int]](repeating: [Int](repeating: 0, count: n), count: n)

    let start = Date()
    
    for i in 0...(n-1){
      for j in 0...(n-1){
        sub[i][j] = aux1[i][j] - aux2[i][j]
      } 
    }  

    let end = Date()
    let consumedTime = end.timeIntervalSince(start)
    
    // print("==========Matriz1==========")
    // printarMatriz(matriz:matriz1 ,n:n)
    // print("==========Matriz2==========")
    // printarMatriz(matriz:matriz2 ,n:n)
    // print("===Subtracao matriz sequencial===")
    // printarMatriz(matriz:sub ,n:n)

    print("\n\nTEMPO EXEC SEQUENCIAL: ",consumedTime,"\n\n")
  }



  func escolheMaiorSeq(matriz1: [[Int]], matriz2: [[Int]], n: Int){

    let aux1 = matriz1
    let aux2 = matriz2
    var maior = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

    let start = Date()
    
    
    for i in 0...(n-1){
      for j in 0...(n-1){
        if(aux1[i][j]>aux2[i][j]){
          maior[i][j] = aux1[i][j]
        }else{
          maior[i][j] = aux2[i][j]
        }
      } 
    }  

    let end = Date()
    let consumedTime = end.timeIntervalSince(start)
    
    // print("==========Matriz1==========")
    // printarMatriz(matriz:matriz1 ,n:n)
    // print("==========Matriz2==========")
    // printarMatriz(matriz:matriz2 ,n:n)
    // print("===Escolhe maior matriz sequencial===")
    // printarMatriz(matriz:maior ,n:n)

    print("\n\nTEMPO EXEC SEQUENCIAL: ",consumedTime,"\n\n")
  }


func multiplicacaoMatrizesSeq(matriz1: [[Int]], matriz2: [[Int]], n: Int){
        let aux1=matriz1
        let aux2=matriz2
        var mult=[[Int]](repeating: [Int](repeating: 0, count: n), count: n)

        let start = Date()
     
        for i in 0...(n-1){
          for j in 0...(n-1){
              mult[i][j]=aux1[i][j]*aux2[i][j]

          } 
        }    

        let end = Date()
        let consumedTime = end.timeIntervalSince(start)
  
    //   print("==========Matriz1==========")
    //   printarMatriz(matriz:matriz1 ,n:n)
    //   print("==========Matriz2==========")
    //   printarMatriz(matriz:matriz2 ,n:n)
    //   print("===Multiplicacao matriz Sequencial===")
    //   printarMatriz(matriz:mult ,n:n)

      print("\n\nTEMPO EXEC SEQUENCIAL: ",consumedTime,"\n\n")
}


func gerarMatriz(n: Int)->[[Int]]{
  var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

  for i in 0..<n{
    for j in 0..<n{
      arr[i][j]=Int.random(in: 0..<20)
    }    
  }

  return arr
}


func printarMatriz(matriz: [[Int]], n: Int){

  for i in 0..<n{
    for j in 0..<n{
      print(matriz[i][j], terminator: " ")
    }    
    print("\n")
  }

}

var exit=0

repeat{
    Glibc.system("clear")
    print( "====== MENU DE EXECUCAO DO PROGRAMA======\n");
    print("(1) Soma de Matrizes(10,100,1000)\n(2) Subtracao de Matrizes(10,100,1000)\n(3) Multiplicacao de Matrizes(10,100,1000)\n(4) Escolhe Maior \n(0) EXIT\n");
    print("Digite sua escolha: ", terminator: "")

    let choose = readLine()
    let num = (choose! as NSString) .integerValue  

    switch(num){
        case 1:
            print("Digite o tamanho (10, 100 ou 1000): ", terminator: "")
            let choose2 = readLine()
            let num2 = (choose2! as NSString) .integerValue  
            if(num2==10||num2==100||num2==1000){
                let mtx1=gerarMatriz(n: num2)
                let mtx2=gerarMatriz(n: num2)
                print( "\n====== TEMPOS DE EXECUCAO ======", terminator: "");
                somaMatrizesSeq(matriz1: mtx1,matriz2: mtx2, n: num2)
                opMatrizesThread(matriz1: mtx1,matriz2: mtx2, n: num2,op: "Soma")
                _=readLine()
            }
            break
        case 2:
            print("Digite o tamanho (10, 100 ou 1000): ", terminator: "")
            let choose2 = readLine()
            let num2 = (choose2! as NSString) .integerValue  
            if(num2==10||num2==100||num2==1000){
                let mtx1=gerarMatriz(n: num2)
                let mtx2=gerarMatriz(n: num2)
               print( "\n====== TEMPOS DE EXECUCAO ======", terminator: "");
                subtracaoMatrizesSeq(matriz1: mtx1,matriz2: mtx2, n: num2)
                opMatrizesThread(matriz1: mtx1,matriz2: mtx2, n: num2,op: "Sub")
                _=readLine()
            }
            break
        case 3:
            print("Digite o tamanho (10, 100 ou 1000): ", terminator: "")
            let choose2 = readLine()
            let num2 = (choose2! as NSString) .integerValue  
            if(num2==10||num2==100||num2==1000){
                let mtx1=gerarMatriz(n: num2)
                let mtx2=gerarMatriz(n: num2)
               print( "\n====== TEMPOS DE EXECUCAO ======", terminator: "");
                multiplicacaoMatrizesSeq(matriz1: mtx1,matriz2: mtx2, n: num2)
                opMatrizesThread(matriz1: mtx1,matriz2: mtx2, n: num2,op: "Mult")
                _=readLine()
            }
            break
        case 4:
            print("Digite o tamanho (10, 100 ou 1000): ", terminator: "")
            let choose2 = readLine()
            let num2 = (choose2! as NSString) .integerValue  
            if(num2==10||num2==100||num2==1000){
                let mtx1=gerarMatriz(n: num2)
                let mtx2=gerarMatriz(n: num2)
                print( "\n====== TEMPOS DE EXECUCAO ======", terminator: "");
                escolheMaiorSeq(matriz1: mtx1,matriz2: mtx2, n: num2)
                opMatrizesThread(matriz1: mtx1,matriz2: mtx2, n: num2,op: "Maior")
                _=readLine()
            }
            break
        case 0:
            exit=1;
            break
        default:
          break;
    }
}while(exit==0);