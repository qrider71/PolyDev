package com.mre.algos;

import java.util.Optional;
import java.util.function.Supplier;

/**
 * @author Markus Reith
 */
public class Utils {

    /**
     * Measures the average duration for the specified action in ms.
     * The supplier will be executed multiple times as specified.
     * 
     * @param <T>
     * @param action
     * @param repeat number of repetitions
     * @return
     */
    public static <T> T measurePerformance(Supplier<T> action, int repeat) {
        final long start = System.currentTimeMillis();
        T result = null;
        for (int i = 0; i < repeat; i++) {
            result = action.get();
        }
        final long end = System.currentTimeMillis();
        final long duration = (end - start) / repeat;
        System.out.println("duration [ms]:" + duration);
        return result;
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