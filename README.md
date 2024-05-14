  # Script para criação de novos projetos Type Script
  
  Esse código em lote (arquivo .bat) é usado para automatizar a criação de um novo projeto TypeScript no Visual Studio Code (VS Code).
Vou explicar cada parte:

## Arquivo ippD.bat

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

## Arquivo codj.bat
  --> ```codj```:
  -> O script codj.bat é um lote do Windows que realiza a seguinte sequência de operações:

  Desativa a exibição de comandos com o comando ```@echo off```.

  *1.* Habilita a expansão de variáveis atrasadas com setlocal enabledelayedexpansion, o que permite o uso de variáveis dentro de blocos de código (como loops).
  
  *2*. Define as variáveis ```TSConfig``` para o nome do arquivo de configuração e ```TempFile``` para o nome de um arquivo temporário.

  *3*. Inicializa a variável LineNumber com zero, que será usada para rastrear o número da linha atual durante a leitura do arquivo.

  *4*. Inicia um loop para ler cada linha do arquivo ```tsconfig.json```.

  *5*. Incrementa a variável LineNumber a cada iteração do loop.

  *6*. Verifica se a linha atual é a 12ª ou a 53ª linha e, em caso afirmativo, modifica o conteúdo da linha:
    - Na linha 12, altera a opção ```"target": "es2016"```(1) para ```"target": "ES2020"```.
    - Na linha 53, altera a opção ```"outDir": "./"``` para ```"outDir": "./javascript"```.
    
  <span style="font-size: 12px;">**Observação: (1)**

  <span style="font-size: 12px;">Aqui estão algumas informações relevantes sobre o “target”:

<span style="font-size: 12px;">Valores Possíveis:
O “target” pode ser configurado com os seguintes valores:

<span style="font-size: 12px;">“ES3”: Gera código JavaScript compatível com ECMAScript 3 (ES3).  
“ES5”: Gera código JavaScript compatível com ECMAScript 5 (ES5).  
“ES6” ou “ES2015”: Gera código JavaScript compatível com ECMAScript 2015 (ES6).  
“ES2016”: Gera código JavaScript compatível com ECMAScript 2016 (ES7).  
“ES2017”: Gera código JavaScript compatível com ECMAScript 2017 (ES8).  
“ESNext”: Gera código JavaScript compatível com a versão mais recente do ECMAScript (ESNext).

<span style="font-size: 12px;">Benefícios de Usar Versões Posteriores ao ES2015:  
Ao usar uma versão mais recente do ECMAScript (como ES2016), você pode se beneficiar de:  
 <span style="font-size: 12px;">- Bundles Menores: O código gerado pode ser mais compacto, especialmente se você estiver usando recursos específicos das versões mais recentes.
 <span style="font-size: 12px;">- Recursos Nativos: Menos necessidade de polyfills, pois navegadores modernos oferecem suporte a mais recursos nativamente.
 <span style="font-size: 12px;">- Melhor Desempenho: Alguns recursos mais recentes podem ser otimizados para desempenho.  

<span style="font-size: 12px;">º _No entanto, tenha em mente que, se você segmentar versões mais recentes, os navegadores mais antigos podem encontrar erros de tempo de execução se usarem recursos não suportados por sua versão específica._</span>

  *7*. Redireciona a saída modificada para um arquivo temporário.

  *10*. Substitui o arquivo tsconfig.json original pelo arquivo temporário modificado com o comando ```move /y %TempFile% %TSConfig%```.

  *11*. Exibe uma mensagem informando que a alteração foi concluída com sucesso.

Essencialmente, o script modifica o arquivo tsconfig.json para mudar a versão do alvo do TypeScript para ES2020 e o diretório
de saída para uma pasta chamada javascript. Após a execução, o arquivo tsconfig.json original é atualizado com essas alterações.



  ### Como fazer funcionar no PowerShell e Command prompt
  
  **Passo 1**  
  Cria uma pasta em local a sua escolha e coloque os arquivos ```ippD.bat e o codj.bat``` dentro da mesma.  
  
  **Passo 2**  
  Para que os comando sejam reconhecidos no prompt de comando do Windows 11 deve-se acrescentar o caminha ao path.  
    º Anote o caminha da pasta onde gravou os arquivos.bat.  
  
  No PowerShell: Utilize o comando:
    
    setx PATH %PATH%;C:\Caminho\Para\Pasta onde salvou os arquivos\"

.

    $env:PATH
  
  Confira se o caminho para pasta que criou foi adicionada com sucesso.
      
  ### Como fazer funcionar no Git Bash

  **Passo 1**  
  _Abra o Git Bash._

  Execute o seguinte comando para editar o arquivo .bashrc:

    nano ~/.bashrc

  **Observação:**  
  _Apartir desse momento você estará dentro do editor de texto nano._   

  **Passo 2**  
  Dentro do arquivo .bashrc, adicione uma linha que exporta o caminho do diretório do seu script .bat para a variável PATH. Por exemplo:

    export PATH="$PATH:/caminho/para/seu/script"

Certifique-se de substituir /caminho/para/seu/script pelo caminho real onde seu script .bat está localizado.
  > Pressione Ctrl + O, depois pressione Enter para salvar as alterações, e depois Ctrl + X para sair do editor nano.

  **Passo 3**  
  Recarregue o arquivo .bashrc para aplicar as alterações. Você pode fazer isso executando o comando:

     source ~/.bashrc

  Agora, o Git Bash deve reconhecer seu script .bat quando você o chamar pelo nome no terminal. Certifique-se de que seu script .bat tenha permissões de execução adequadas para ser executado no Git Bash.



***Observações:***
  
  Por algum motivo usando o Git Bash no Windows 11 você ainda terá que digita o ```ippD.bat``` ou seja ainda terá que digitar a extensão para que o Bash rode o seu comando.

  ### Você pode executar também desta forma.
  A forma de executar o seu script sem necessecidade de digitar a extensão é abrir um prompt de comando dentro do Git Bash digitando o comando:
  
    cmd

  Assim o command prompt do windows irá rodar, digite ```ippd``` e aguarde a criação do seu projeto. Após o término da criação em Type Script usar o camando:

    exit

  Pronto agora o céu é o limite...
