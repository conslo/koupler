package com.monetate.koupler;

import static org.junit.Assert.assertEquals;

import java.util.concurrent.atomic.AtomicInteger;

public class MockKinesisEventProducer extends KinesisEventProducer {
    public MockKinesisEventProducer() {
        super(10000);
    }

    public AtomicInteger COUNT = new AtomicInteger();

    @Override
    public void queueEvent(String event) {
        COUNT.getAndIncrement();
    }

    public void waitFor(int expectedCount) throws InterruptedException {
        long totalWaitTime = 0;
        while (expectedCount != COUNT.get()) {
            Thread.sleep(10);
            totalWaitTime += 10;
            if (totalWaitTime > 5000) {
                assertEquals("Did not queue all records!", expectedCount, COUNT.get());
            }
        }
    }
}
