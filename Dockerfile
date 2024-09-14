#O que está comentado é o segredo pra ter uma imagem pequena

# Imagem go Alpine que é uma distribuição Linux leve
FROM golang:alpine3.14 as builder

WORKDIR /app
COPY . .

# build para compilar o código Go
RUN go build -o /main main.go

# 'scratch' é uma imagem base mínima, sem qualquer software pré-instalado
FROM scratch

WORKDIR /

# Copia o binário compilado da etapa 'builder' para a nova imagem
COPY --from=builder /main /main

ENTRYPOINT ["/main"]