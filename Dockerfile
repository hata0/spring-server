FROM gcr.io/distroless/base-debian13

WORKDIR /opt/spring-server

COPY build/native/nativeCompile/spring-server /opt/spring-server/spring-server

RUN chmod +x /opt/spring-server/spring-server

ENV PORT 8080

USER nonroot:nonroot

ENTRYPOINT ["/opt/spring-server/spring-server"]
