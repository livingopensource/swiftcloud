FROM golang:1.22-alpine as build

WORKDIR /src/app

RUN go install github.com/arthurkay/serve@latest

COPY . .

WORKDIR /src/app/site

FROM gcr.io/distroless/static-debian11
ENV TZ=Africa/Lusaka
WORKDIR /app

COPY --from=build /go/bin/serve .
COPY --from=build /src/app/site/ .
CMD ["./serve", "-p", "8000"]

