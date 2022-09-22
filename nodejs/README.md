# Teste Smash Project

## Instalação do DOCKER
1. Instale o [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) e [Docker Compose](https://docs.docker.com/compose/install/)
2. Caso não tenha o repositório do [Altu-serverless](https://github.com/Altu1/altu-serverless), clone ele com o comando 
```
git clone https://github.com/Altu1/altu-serverless.git
```
3. Navegue até a pasta do `nodejs` e execute o comando `make up` (pode demorar um pouco pois vai ser a primeira vez que iremos rodar o comando).
4. Abra uma nova aba no terminal e execute o comando `make sh`
5. Rode o comando `npm install` dentro do container
6. A partir daí, estamos dentro do `container` e pode começar o desenvolvimento/testes das apis. (Rodar os comandos para testar off-line, etc...).

## Estrutura de pastas

* **common**: Contém libs que podem ser usadas por qualquer serviço.
* **node_modules**: Libs declaradas no `package.json`, instaladas pelo comando `npm install`.
* **services**: Pasta onde ficam os serviços. Cada serviço tem sua configuração e suas funções (lambda). O deploy é individual para cada serviço.
* **package.json**: Declaração do projeto e das dependências de bibliotecas externas.
* **serverless.yml**: Configurações gerais, compartilhadas por todos os serviços.

## Como rodar um serviço no ambiente local

Na pasta do projeto, execute o comando:

```
sls offline start -s local --config-file services/<servico>/config.yml
```

Caso prefira, npm ja roda o projeto localmente, ou seja, rode o comando `npm run offline`
```

