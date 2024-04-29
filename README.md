  Esse código em lote (arquivo .bat) é usado para automatizar a criação de um novo projeto TypeScript no Visual Studio Code (VS Code).
Vou explicar cada parte:

  -> ```@echo off:```
**Desativa a exibição dos comandos no terminal**. Isso significa que os comandos subsequentes não serão mostrados na tela durante a execução.
echo Cria novo projeto?:
Exibe a mensagem ```“Cria novo projeto?”``` no terminal.
O usuário verá essa mensagem e poderá responder.

  -> ```pause```:
Pausa a execução do script até que o usuário pressione uma tecla.
Isso permite que o usuário leia a mensagem anterior antes de continuar.

  -> ```npm init -y:```
Inicializa um novo projeto Node.js com as configurações padrão.
O parâmetro -y indica que as perguntas interativas devem ser respondidas automaticamente com “sim”.

  -> ```npm i -D typescript ts-node```:
Instala as dependências typescript e ts-node como dependências de desenvolvimento (-D).
O TypeScript é uma linguagem superset do JavaScript, e o ts-node permite executar arquivos TypeScript diretamente no Node.js.

  -> ```npx tsc --init```:
Inicializa um arquivo de configuração TypeScript (tsconfig.json) no projeto.
Esse arquivo define as opções de compilação para o TypeScript.

  --> ```codj```:
  -> O script codj.bat é um lote do Windows que realiza a seguinte sequência de operações:

  Desativa a exibição de comandos com o comando ```@echo off```.

  *1.* Habilita a expansão de variáveis atrasadas com setlocal enabledelayedexpansion, o que permite o uso de variáveis dentro de blocos de código (como loops).
  
  *2*. Define as variáveis ```TSConfig``` para o nome do arquivo de configuração e ```TempFile``` para o nome de um arquivo temporário.

  *3*. Inicializa a variável LineNumber com zero, que será usada para rastrear o número da linha atual durante a leitura do arquivo.

  *4*. Inicia um loop para ler cada linha do arquivo ```tsconfig.json```.

  *5*. Incrementa a variável LineNumber a cada iteração do loop.

  *6*. Verifica se a linha atual é a 12ª ou a 53ª linha e, em caso afirmativo, modifica o conteúdo da linha:
    - Na linha 12, altera a opção ```"target": "es2016"``` para ```"target": "ES2020"```.
    - Na linha 53, altera a opção ```"outDir": "./"``` para ```"outDir": "./javascript"```.

  *7*. Redireciona a saída modificada para um arquivo temporário.

  *10*. Substitui o arquivo tsconfig.json original pelo arquivo temporário modificado com o comando ```move /y %TempFile% %TSConfig%```.

  *11*. Exibe uma mensagem informando que a alteração foi concluída com sucesso.

Essencialmente, o script modifica o arquivo tsconfig.json para mudar a versão do alvo do TypeScript para ES2020 e o diretório
de saída para uma pasta chamada javascript. Após a execução, o arquivo tsconfig.json original é atualizado com essas alterações.



  **--    Como fazer funcionar no PowerShell e Command prompt    --**
  
  **Passo 1**
  
  Cria uma pasta em local a sua escolha e coloque os arquivos ```ippD.bat e o codj.bat``` dentro da mesma.
  
  **Passo 2 **
  
  Para que os comando sejam reconhecidos no prompt de comando do Windows 11 deve-se acrescentar
  o caminha ao path. 
    > Anote o caminha da pasta onde gravou os arquivos.bat.
    > No prompt de comando: Utilize o comando:
    
      setx PATH %PATH%;C:\Caminho\Para\Pasta onde salvou os arquivos\"
    
  > No PowerShell: Utilize o comando

      $env:PATH
  
  Confira se o caminho para pasta que criou foi adicionada com sucesso.
      
  **Como fazer funcionar no Git Bash**

  **Passo 1**
  > Abra o Git Bash.
    Execute o seguinte comando para editar o arquivo .bashrc:

      nano ~/.bashrc

  > Apartir desse momento você estará dentro do editor de texto nano.   

  **Passo 2**
  > Dentro do arquivo .bashrc, adicione uma linha que exporta o caminho do diretório do seu script .bat para a variável PATH. Por exemplo:

     export PATH="$PATH:/caminho/para/seu/script"

Certifique-se de substituir /caminho/para/seu/script pelo caminho real onde seu script .bat está localizado.
  > Pressione Ctrl + O, depois pressione Enter para salvar as alterações, e depois Ctrl + X        para sair do editor nano.

  **Passo 3**
  > Recarregue o arquivo .bashrc para aplicar as alterações. Você pode fazer isso executando o comando:

     source ~/.bashrc

  > Agora, o Git Bash deve reconhecer seu script .bat quando você o chamar pelo nome no terminal. Certifique-se de que seu script .bat tenha permissões de execução adequadas para ser executado no Git Bash.



***Observações:***
  
  Por algum motivo no Windows 11 você ainda terá que digita o ```ippD.bat``` ou seja   ainda terá que digitar a extensão.

  Outra forma de executar o seu script sem necessecidade de digitar a extensão é abrir um prompt de comando dentro do Git Bash digitando o comando:
  
    cmd

  Para abrir o prompt de comando e após o término da criação do seu projeto em Type Script 
  usar o camando:

    exit
