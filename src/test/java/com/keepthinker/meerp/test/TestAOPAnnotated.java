package com.keepthinker.meerp.test;

import junit.framework.TestCase;

import com.keepthinker.meerp.main.annotated.AOPMainAnnotated;

public class TestAOPAnnotated extends TestCase {
	public void testAOPAnnotated() {
		AOPMainAnnotated aopA=new AOPMainAnnotated();
		aopA.main(null);
	}
}
