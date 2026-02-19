FROM gcr.io/distroless/base-debian13

WORKDIR /opt/spring-server

COPY build/native/nativeCompile/spring-server /opt/spring-server/spring-server

USER nonroot:nonroot
EXPOSE 8080

ENTRYPOINT ["/opt/spring-server/spring-server"]
