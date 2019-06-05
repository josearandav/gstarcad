package com.gstarcad.website.util;

import java.math.BigDecimal;

public class FileUtils {

	private static final long K_BYTES = 1024L;

	private static final long M_BYTES = 1024 * K_BYTES;

	private static final long G_BYTES = 1024 * M_BYTES;

	public static String toSize(Long size) {
		if (size == null)
			return "";
		else if (size == 0L)
			return "";
		else if (size > G_BYTES) {
			double d = (double) size / G_BYTES;
			return String.valueOf(round(d, 2)) + "G";
		} else if (size > M_BYTES) {
			double d = (double) size / 1048576D;
			return String.valueOf(round(d, 2)) + "M";
		} else if (size > K_BYTES) {
			double d = (double) size / 1024D;
			return String.valueOf(round(d, 2)) + "K";
		} else {
			return String.valueOf(size);
		}
	}

	public static double round(double v, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");
		} else {
			BigDecimal b = new BigDecimal(Double.toString(v));
			BigDecimal one = new BigDecimal("1");
			return b.divide(one, scale, 4).doubleValue();
		}
	}

}
