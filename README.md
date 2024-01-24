>## Módulo 04 - Projeto Final - Roteiro

### Executando containers com Docker

Para buildar os Dockerfiles do MySQL e da aplicação, estando na raiz do projeto, executamos:

```bash
docker build -t mysql-team1 -f Dockerfile.mysql .
```

```bash
docker build -t app-team1 -f Dockerfile.app .
```

Para que o MySQL e a aplicação consigam se comunicar, eles precisam estar em uma mesma rede. Para isso criamos uma rede chamada `network-team1` com o comando:

```bash
docker network create network-team1
```

Com isso, para criar e rodar os containers do banco e da aplicação, execute:

```bash
docker run -d -p 3306:3306 --name mysql-team1-container --network network-team1 --network-alias mysql -v team1-mysql-data:/var/lib/mysql mysql-team1
```

```bash
docker run -d -p 80:80 --name app-team1-container --network network-team1 app-team1
```

Para ver o status dos containers:

```bash
docker ps -a
```

Com isso é possível testar o funcionamento da aplicação abrindo o navegador e acessando a URL a seguir:

```bash
http://localhost:80
```

Uma vez tudo testado, vamos parar os containers e removê-los, para ilustrar o uso desses comandos:

```bash
docker stop mysql-team1-container
```

```bash
docker rm mysql-team1-container
```

```bash
docker stop app-team1-container
```

```bash
docker rm app-team1-container
```

### Executando containers com Docker Compose

Uma vez configurado o arquivo `docker-compose.yaml`, basta executar:
```bash
docker compose up -d
```
Para ver o status dos containers criados pelo Docker Compose:

```bash
docker ps -a
```

Para validar se a rede do Docker foi criada corretamente, podemos executar:

```bash
docker network ls
```

Para ver as informações sobre a rede criada, podemos executar:

```bash
docker network inspect devops-ada-04-team1-docker-project_team1-network
```

Se quisermos ver quais containers estão conectados a esta rede, podemos executar:

```bash
docker network inspect -f '{{range .Containers}}{{.Name}}{{"\n"}}{{end}}' devops-ada-04-team1-docker-project_team1-network
```

Para validar a comunicação entre containers, podemos acessar o terminal do container da aplicação com o comando:

```bash
docker exec -it devops-ada-04-team1-docker-project-app-1 sh
```

E executar um comando ping:

```bash
ping mysql
```

Para sair do terminal do container, basta digitar:
```bash
exit
```

E para finalizar a execução dos containers orquestrados pelo Docker Compose, basta executar:

```bash
docker compose down
```
