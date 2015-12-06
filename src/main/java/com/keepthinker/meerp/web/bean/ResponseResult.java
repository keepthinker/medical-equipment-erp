package com.keepthinker.meerp.web.bean;

public class ResponseResult {
	private ResponseStatus status;
	private InputCheckResult inputCheckResult;
	private String other;
	public ResponseStatus getStatus() {
		return status;
	}
	public void setStatus(ResponseStatus status) {
		this.status = status;
	}
	public InputCheckResult getInputCheckResult() {
		return inputCheckResult;
	}
	public void setInputCheckResult(InputCheckResult inputCheckResult) {
		this.inputCheckResult = inputCheckResult;
	}
	
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	@Override
	public String toString() {
		return "ResponseResult [status=" + status + ", inputCheckResult="
				+ inputCheckResult + ", other=" + other + "]";
	}

	
}
