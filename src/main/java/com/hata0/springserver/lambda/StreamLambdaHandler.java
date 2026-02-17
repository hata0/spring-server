package com.hata0.springserver.lambda;

import com.amazonaws.serverless.proxy.spring.SpringBootLambdaContainerHandler;
import com.amazonaws.serverless.proxy.model.AwsProxyRequest;
import com.amazonaws.serverless.proxy.model.AwsProxyResponse;
import com.amazonaws.services.lambda.runtime.RequestStreamHandler;

import java.io.InputStream;
import java.io.OutputStream;

public class StreamLambdaHandler implements RequestStreamHandler {

    private static final SpringBootLambdaContainerHandler<AwsProxyRequest, AwsProxyResponse> handler;

    static {
        try {
            handler = SpringBootLambdaContainerHandler.getAwsProxyHandler(
                    com.hata0.springserver.SpringServerApplication.class
            );
        } catch (Exception e) {
            throw new RuntimeException("Failed to initialize Spring context", e);
        }
    }

    @Override
    public void handleRequest(InputStream input, OutputStream output, com.amazonaws.services.lambda.runtime.Context context)
            throws java.io.IOException {
        handler.proxyStream(input, output, context);
    }
}
