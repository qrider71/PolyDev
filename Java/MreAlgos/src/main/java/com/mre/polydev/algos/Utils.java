package com.mre.polydev.algos;

import java.util.Optional;
import java.util.function.Supplier;

/**
 * @author Markus Reith
 */
public class Utils {

    public static class PerformanceResult <T> {
        private final long duration;
        private final T result;

        public PerformanceResult(final long duration, final T result) {
            this.duration = duration;
            this.result = result;
        }

        public long getDuration() {
            return duration;
        }

        public T getResult() {
            return result;
        }  
    }

    /**
     * Measures the average duration for the specified action in ms.
     * The supplier will be executed multiple times as specified.
     * 
     * @param <T>
     * @param action
     * @param repeat number of repetitions
     * @return
     */
    public static <T>  PerformanceResult<T> measurePerformance(Supplier<T> action, int repeat) {
        
        final long start = System.currentTimeMillis();
        T result = null;
        for (int i = 0; i < repeat; i++) {
            result = action.get();
        }
        final long end = System.currentTimeMillis();
        final long duration = (end - start) / repeat;
        
        return new PerformanceResult<T>(duration, result);
    }

    /**
     * tries to get an integer from a command line args array
     * @param args
     * @return
     */
    public static Optional<Integer> getIntFromArgs(final String[] args) {
        if (args.length > 0) {
            try {
                final Integer result = Integer.parseInt(args[0]);
                return Optional.of(result);
            } catch (NumberFormatException e) {
                return Optional.empty();
            }
        } else {
            return Optional.empty();
        }
    }
}