🐳 Docker – Laboratório Prático

📌 Descrição

Este laboratório tem como objetivo demonstrar o uso básico do Docker, abordando conceitos fundamentais como:

Imagens

Containers

Dockerfile

Execução de aplicações em ambiente isolado

O laboratório foi executado utilizando plataformas gratuitas, principalmente o Play with Docker, simulando um ambiente real de trabalho.

🎯 Objetivos do laboratório

Entender o que é Docker e para que serve

Criar uma imagem Docker a partir de um Dockerfile

Executar um container baseado nessa imagem

Expor uma aplicação simples via porta

🛠️ Tecnologias utilizadas

Docker

Linux

Nginx (imagem oficial)

Play with Docker

📂 Arquivos deste diretório
docker/
├── Dockerfile
└── README.md

📄 Dockerfile

O Dockerfile define a criação de uma imagem Docker simples baseada no Nginx, utilizada para servir uma página web básica.

Exemplo de Dockerfile:
FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80


📌 Explicação:

FROM nginx:latest → usa a imagem oficial do Nginx

COPY → copia o arquivo HTML para o container

EXPOSE 80 → expõe a porta padrão do Nginx

▶️ Como executar o laboratório
1️⃣ Build da imagem
docker build -t docker-lab-nginx .

2️⃣ Executar o container
docker run -d -p 8080:80 docker-lab-nginx

3️⃣ Acessar a aplicação

Abra o navegador e acesse:

http://localhost:8080


(No Play with Docker, use o link gerado pela plataforma.)

🧪 Plataforma utilizada

Play with Docker

Ambiente Docker real no navegador

Sem necessidade de instalação local

Ideal para testes rápidos e aprendizado

🧠 Aprendizados obtidos

Diferença entre imagem e container

Como criar imagens customizadas

Como mapear portas entre host e container

Importância do Dockerfile para padronização de ambientes

📌 Possíveis melhorias

Criar uma imagem multi-stage

Usar variáveis de ambiente

Integrar com Docker Compose

Automatizar build com CI/CD

✅ Conclusão

Este laboratório demonstra conhecimentos básicos e práticos de Docker, essenciais para ambientes de Cloud, DevOps e Infraestrutura, servindo como base para evoluir para ambientes orquestrados com Kubernetes.

👤 Autor

Cainã Pereira