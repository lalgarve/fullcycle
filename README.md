# fullcycle-desafiogo
Desafio:

Criar um Dockerfile com uma aplicação escrita em Golang. A imagem precisa ter menos de 2 MB.

Solução: Usar um build com dois estágios.

## Primeiro estágio:

* A partir de uma imagem Ubuntu, instala o Goland. 
* Usando echo cria o arquivo go.
* Builda a aplicação.

## Segundo estágio:
* A partir da imagem scratch, a mesma do hello-world
* Copia o executavel gerado
